//! @title Top level Simulink version of the CIC upconverter filter
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1.0
//! @date 08/04/25
//! @brief Simulink model of the CIC upconverter filter (R=10, M=3, N=1) with the corresponding FIR compensation.
//!  The operating clocks are: Differential 200 MHz, fx = 7.68 MHz, R*fx = 76.8 MHz

`timescale 1ns / 1ps

module top_simulink
  (
    // Control Signals
    i_rst,
    i_clk_p,
    i_clk_n,

    // Data Signals
    i_real,
    i_imag,
    o_real,
    o_imag

  );

  input                         i_rst;              //! Main Reset
  input                         i_clk_p;            //! Differential Clock Input P
  input                         i_clk_n;            //! Differential Clock Input N
  input  wire signed [15:0]     i_real;             //! Input Data In-Phase
  input  wire signed [15:0]     i_imag;             //! Input Data Quadrature
  output wire signed [15:0]     o_real;             //! Output Data In-Phase
  output wire signed [15:0]     o_imag;             //! Output Data Quadrature


  // --------------------------------------------------------------- //
  //*********************** Wire Declarations ***********************//
  // --------------------------------------------------------------- //

  //! Clock
  wire                    clk_lo;           //! Clock for sampling signal (7.68 MHz)
  wire                    clk_hi;           //! Clock for interpolated output (76.8 MHz)

  //! Reset
  wire                    rst_lo;           //! Reset sync to clk_lo
  wire                    rst_lo_n;         //! Reset sync to clk_lo, low active
  wire                    rst_hi;           //! Reset sync to clk_hi
  wire                    rst_hi_n;         //! Reset sync to clk_hi, low active

  // --------------------------------------------------------------- //
  // ********************** Clock generation *********************** //
  // --------------------------------------------------------------- //

  //! Clocks generation from transceiver clock, Vivado IP
  clk_wiz_0 clk_wiz_0_i
            (
              .clk_hi       (clk_hi),
              .clk_lo       (clk_lo),
              .clk_in1_p    (i_clk_p),
              .clk_in1_n    (i_clk_n)
            );


  // --------------------------------------------------------------- //
  // ************************** Reset  ***************************** //
  // --------------------------------------------------------------- //

  //! Synchronize asynchronous reset to signal clock domain
  synchronizer synchronizer_rst_lo
               (
                 .sync_out   (rst_lo),
                 .async_in   (i_rst),
                 .clk        (clk_lo)
               );

  //! Synchronize asynchronous reset to interpolated output clock domain
  synchronizer synchronizer_rst_hi
               (
                 .sync_out   (rst_hi),
                 .async_in   (i_rst),
                 .clk        (clk_hi)
               );

  //! Low-active reset
  assign      rst_lo_n = ~rst_lo;
  assign      rst_hi_n = ~rst_hi;

  // --------------------------------------------------------------- //
  // *******************  Digital Upconversion   ******************* //
  // --------------------------------------------------------------- //

  //! Filtering and interpolation from fx to fc, CIC filter, System Generator IP
  cic_x10_0 cic_x10_0_i
            (
              .clk        (clk_hi),
              .rst_n      (rst_hi_n),
              .real_fs    (i_real),
              .imag_fs    (i_imag),
              .real_fc    (o_real),
              .imag_fc    (o_imag)
            );



endmodule
