//! @title Comparative of CIC upconverter filters, designed with Simulink and Verilog
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1.0
//! @date 05/04/25
//! @brief Instantiate the Simulink and Verilog models of the CIC upconverter filter (R=10, M=3, N=3) with the corresponding FIR compensation.
//  The real and imaginary data are read from the files. The output data is saved in different files to further comparation.

`timescale 1ns / 1ps

module top_tb;

  // --------------------------------------------------------------- //
  //******************* Parameter Declarations **********************//
  // --------------------------------------------------------------- //
  parameter    NBits           = 16;
  parameter    NCoeff          = 86;
  parameter    Coeff_File      = "M86_coefficients.dat";
  parameter    Width           = 20;
  parameter    R               = 10;
  parameter    M               = 3;
  parameter    N               = 3;
  parameter    NData           = 1024;
  parameter    CLK_PERIOD      = 5;

  // --------------------------------------------------------------- //
  //******************** Register Declarations **********************//
  // --------------------------------------------------------------- //
  reg                         i_rst;                  //! Reset
  reg                         i_clk_p;                //! Differential clock P
  reg signed  [NBits-1:0]     data_real[0:NData-1];   //! Mem data
  reg signed  [NBits-1:0]     data_imag[0:NData-1];   //! Mem data
  reg         [11:0]          idx;                    //! Index to read the data
  reg         [15:0]          idx_fc;                 //! Index to read the data

  // --------------------------------------------------------------- //
  //*********************** Wire Declarations ***********************//
  // --------------------------------------------------------------- //
  wire                        i_clk_n;                //! Differential clock N
  wire signed [NBits-1:0]     i_real;                 //! Input data real
  wire signed [NBits-1:0]     i_imag;                 //! Input data imag
  wire signed [NBits-1:0]     o_real_1;               //! Output data real, Simulink
  wire signed [NBits-1:0]     o_imag_1;               //! Output data imag, Simulink
  wire signed [NBits-1:0]     o_real_2;               //! Output data real, Verilog
  wire signed [NBits-1:0]     o_imag_2;               //! Output data imag, Verilog

  // --------------------------------------------------------------- //
  //*********************** DUT Instantiation ***********************//
  // --------------------------------------------------------------- //

  //! Instantiate the Simulink model
  top_simulink top_simulink_i (
                 // Control Signals
                 .i_rst        (i_rst),
                 .i_clk_p      (i_clk_p),
                 .i_clk_n      (i_clk_n),
                 // Data Signals
                 .i_real       (i_real),
                 .i_imag       (i_imag),
                 .o_real       (o_real_1),
                 .o_imag       (o_imag_1)
               );

  //! Instantiate the Verilog model
  top_verilog #(
                // Parameters
                .NBits      (NBits),
                .NCoeff     (NCoeff),
                .Coeff_File (Coeff_File),
                .Width      (Width),
                .R          (R),
                .M          (M),
                .N          (N)
              ) top_verilog_i
              (
                // Control Signals
                .i_rst      (i_rst),
                .i_clk_p    (i_clk_p),
                .i_clk_n    (i_clk_n),
                // Data Signals
                .i_real     (i_real),
                .i_imag     (i_imag),
                .o_real     (o_real_2),
                .o_imag     (o_imag_2)
              );

  // --------------------------------------------------------------- //
  //************************** Main Test ****************************//
  // --------------------------------------------------------------- //
  initial
  begin

    // Read the complex data from the files
    $readmemh("real_fx_n10_hex.dat",data_real,0,NData-1);
    $readmemh("imag_fx_n10_hex.dat",data_imag,0,NData-1);

    // Initialize Inputs
    i_rst       = 1'b0;
    idx         = 1'b0;

    // Apply reset
    #(200*CLK_PERIOD);
    i_rst         = 1'b1;
    #(50*CLK_PERIOD);
    i_rst         = 1'b0;
    #(50*CLK_PERIOD);

    // Scan data_in and feed the filter
    for (idx = 0; idx < NData; idx = idx + 1)
    begin
      @(posedge top_tb.top_simulink_i.clk_lo);
    end

    $finish;
  end

  assign  i_real = data_real[idx];
  assign  i_imag = data_imag[idx];


  //-------------------- Generate Differential Clock -----------------------
  initial
    i_clk_p = 1'b1;
  always
    #(CLK_PERIOD/2) i_clk_p = !i_clk_p;

  assign i_clk_n = !i_clk_p;

  // --------------------------------------------------------------- //
  //****************** Save output data to a file *******************//
  // --------------------------------------------------------------- //
  integer file_1, file_2, file_3, file_4;

  initial
  begin
    file_1 = $fopen("out_real_sim.txt", "w");
    file_2 = $fopen("out_imag_sim.txt", "w");
    file_3 = $fopen("out_real_ver.txt", "w");
    file_4 = $fopen("out_imag_ver.txt", "w");
    if (file_1 == 0 || file_2 == 0 || file_3 == 0 || file_4 == 0)
    begin
      $display("Error abriendo el archivo.");
      $finish;
    end

    for (idx_fc = 0; idx_fc < NData*R; idx_fc = idx_fc + 1)
    begin
      @(posedge top_tb.top_simulink_i.clk_hi);
      $fwrite(file_1, "%h\n", top_tb.top_simulink_i.o_real); 
      $fwrite(file_2, "%h\n", top_tb.top_simulink_i.o_imag); 
      $fwrite(file_3, "%h\n", top_tb.top_verilog_i.o_real); 
      $fwrite(file_4, "%h\n", top_tb.top_verilog_i.o_imag); 
    end
    $fclose(file_1);
    $fclose(file_2);
    $fclose(file_3);
    $fclose(file_4);
  end

  //-------------------------- Signal Monitor ------------------------------
  // initial
  // begin
  //   $monitor("Time = %0t | data_in = %h | data_out = %h | i_rst = %b",
  //            $time, data_in, data_out, i_rst);
  // end

endmodule
