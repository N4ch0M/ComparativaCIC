//! @title Top level RFPWM - From LTE 1.4 MHz signal to RF (k=6)
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1
//! @date 28/08/23
//! @brief RF Pulse Width Modulator, Outphasing Implementation Fc = 230.4 MHz, Fpwm = 38.4 MHz, q=192, BW=1.4 MHz
//! Using a FIR filtering and interpolation FIR, upconverts by two (from 1.92 MHz to 3.84 MHz).
//! Then, CIC interpolation x12 is applied to get the baseband signal at Fpwm, where is predistorted with k=6 to achieve
//! outphasing signals psi+ and psi-. Noise shaping is applied before the quantization to 192 levels. Finally,
//! the pulse position and pulse width modulated signal is generated and transmitted using the transceiver.

`timescale 1ns / 1ps

module top
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
  wire                    clk_lo;           //! Clock DRP (115.2 MHz)
  wire                    clk_hi;           //! Clock for FIR filters (7.68 MHz, uses TDM)

  //! Reset
  wire                    rst_lo;           //! Reset sync to clk_lo
  wire                    rst_lo_n;         //! Reset sync to clk_lo, low active
  wire                    rst_hi;           //! Reset sync to clk_hi
  wire                    rst_hi_n;         //! Reset sync to clk_hi, low active

  //! Upconversion CIC x10
//   wire  signed [15:0]     real_fc;          //! Data In-Phase filtered and sampled at R*Fx
//   wire  signed [15:0]     imag_fc;          //! Data Quadrature filtered and sampled at R*Fx

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

  //! Synchronize asynchronous reset to FIR clock domain
  synchronizer synchronizer_rst_lo
               (
                 .sync_out   (rst_lo),
                 .async_in   (i_rst),
                 .clk        (clk_lo)
               );

  //! Synchronize asynchronous reset to PWM clock domain
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
