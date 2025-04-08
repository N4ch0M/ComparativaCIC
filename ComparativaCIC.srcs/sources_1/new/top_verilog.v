//! @title Top level Verilog version of the CIC upconverter filters
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1.0
//! @date 05/04/25
//! @brief Verilog model of the CIC upconverter filter (R=10, M=3, N=3) with the corresponding FIR compensation.
//  The operating clocks are: Differential 200 MHz, fx = 7.68 MHz, R*fx = 76.8 MHz

`timescale 1ns / 1ps

module top_verilog
  #(
     parameter  NBits      = 16,                     //! Number of bits data signal
     parameter  NCoeff     = 86,                     //! Number of Coefficients FIR
     parameter  Coeff_File = "M86_coefficients.dat", //! Coefficients filename
     parameter  Width      = 20,                     //! Number of bits internal registers
     parameter  R          = 10,                     //! Interpolation ratio
     parameter  M          = 1,                      //! Number of delays
     parameter  N          = 3                       //! Number of sections
   )
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

  //! Filtering and interpolation from fx to fc, Verilog filters, Real Data
  cic_int_comp #(
                 // Parameters
                 .NBits      (NBits),
                 .NCoeff     (NCoeff),
                 .Coeff_File (Coeff_File),
                 .Width      (Width),
                 .R          (R),
                 .M          (M),
                 .N          (N)
               ) cic_int_comp_i1 (
                 // Control Signals
                 .clk        (clk_lo),
                 .clk_int    (clk_hi),
                 .rst        (rst_lo),
                 // Data Signals
                 .data_in    (i_real),
                 .data_out   (o_real)
               );

  //! Filtering and interpolation from fx to fc, Verilog filters, Imaginary Data
  cic_int_comp #(
                 // Parameters
                 .NBits      (NBits),
                 .NCoeff     (NCoeff),
                 .Coeff_File (Coeff_File),
                 .Width      (Width),
                 .R          (R),
                 .M          (M),
                 .N          (N)
               ) cic_int_comp_i2 (
                 // Control Signals
                 .clk        (clk_lo),
                 .clk_int    (clk_hi),
                 .rst        (rst_lo),
                 // Data Signals
                 .data_in    (i_imag),
                 .data_out   (o_imag)
               );


endmodule
