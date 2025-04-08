//! @title Comparative of CIC upconverter filters, designed with Simulink and Verilog
//! @author J. I. Morales (morales.juan.ignacio@gmail.com)
//! @version 1.0
//! @date 08/04/25
// ! @brief Instantiate the Simulink and Verilog models of the CIC upconverter filter (R=10, M=1, N=3) with the corresponding FIR compensation. 
//!  The real and imaginary data are read from the files. The output data is saved in different files to further comparation.


`timescale 1ns / 1ps

module top_tb;

  // --------------------------------------------------------------- //
  //******************* Parameter Declarations **********************//
  // --------------------------------------------------------------- //
  // Data Parameters
  parameter NBits       = 16;                       //! Number of bits data signal  
  // FIR Parameters
  parameter NCoeff      = 86;                       //! Number of Coefficients FIR
  parameter Coeff_File  = "M86_coefficients.dat";   //! Coefficients filename
  // CIC Parameters
  parameter Width       = 24;                       //! Number of bits internal registers 
  parameter R           = 10;                       //! Interpolation ratio
  parameter M           = 1;                        //! Number of delays  
  parameter N           = 3;                        //! Number of sections
  // Test Parameters
  parameter CLK_PERIOD  = 5;                        //! Clock period in ns (200 MHz)
  parameter NDataB      = 14;                       //! Number of data to be read from the files
  parameter NData       = 16384;                     //! Number of data to be read from the files
  parameter Real_File   = "real_fx_n14_hex.dat";    //! Input Data real filename
  parameter Imag_File   = "imag_fx_n14_hex.dat";    //! Input Data imag filename
  parameter Real_Ver    = "real_ver_n14.txt";        //! Output Data real filename, Verilog 
  parameter Imag_Ver    = "imag_ver_n14.txt";        //! Output Data real filename, Verilog 
  parameter Real_Sim    = "real_sim_n14.txt";        //! Output Data real filename, Simulink 
  parameter Imag_Sim    = "imag_sim_n14.txt";        //! Output Data real filename, Simulink 

  // --------------------------------------------------------------- //
  //******************** Register Declarations **********************//
  // --------------------------------------------------------------- //
  reg                       i_rst;                  //! Reset
  reg                       i_clk_p;                //! Differential clock P
  reg signed  [NBits-1:0]   data_real[0:NData-1];   //! Mem data real
  reg signed  [NBits-1:0]   data_imag[0:NData-1];   //! Mem data imag

  // --------------------------------------------------------------- //
  //*********************** Wire Declarations ***********************//
  // --------------------------------------------------------------- //
  wire                      i_clk_n;    //! Differential clock N
  wire signed [NBits-1:0]   i_real;     //! Input data real
  wire signed [NBits-1:0]   i_imag;     //! Input data imag
  wire signed [NBits-1:0]   o_real_1;   //! Output data real, Simulink
  wire signed [NBits-1:0]   o_imag_1;   //! Output data imag, Simulink
  wire signed [NBits-1:0]   o_real_2;   //! Output data real, Verilog
  wire signed [NBits-1:0]   o_imag_2;   //! Output data imag, Verilog

  // --------------------------------------------------------------- //
  //******************** Integer Declarations ***********************//
  // --------------------------------------------------------------- //
  integer                   idx_fx;     //! Index to read the data @ fx
  integer                   idx_fc;     //! Index to write the data @ fc


  // --------------------------------------------------------------- //
  //*********************** DUT Instantiation ***********************//
  // --------------------------------------------------------------- //

  //! Instantiate the Simulink model
  top_simulink top_simulink_i (
      // Control Signals
      .i_rst  (i_rst),
      .i_clk_p(i_clk_p),
      .i_clk_n(i_clk_n),
      // Data Signals
      .i_real (i_real),
      .i_imag (i_imag),
      .o_real (o_real_1),
      .o_imag (o_imag_1)
  );

  //! Instantiate the Verilog model
  top_verilog #(
      // Parameters
      .NBits     (NBits),
      .NCoeff    (NCoeff),
      .Coeff_File(Coeff_File),
      .Width     (Width),
      .R         (R),
      .M         (M),
      .N         (N)
  ) top_verilog_i (
      // Control Signals
      .i_rst  (i_rst),
      .i_clk_p(i_clk_p),
      .i_clk_n(i_clk_n),
      // Data Signals
      .i_real (i_real),
      .i_imag (i_imag),
      .o_real (o_real_2),
      .o_imag (o_imag_2)
  );

  // --------------------------------------------------------------- //
  //************************** Main Test ****************************//
  // --------------------------------------------------------------- //
  initial begin

    // Read the complex data from the files
    $readmemh(Real_File, data_real, 0, NData - 1);
    $readmemh(Imag_File, data_imag, 0, NData - 1);

    // Initialize Inputs
    i_rst   = 1'b0;
    idx_fx  = 1'b0;

    // Apply reset
    #(200 * CLK_PERIOD);
    i_rst = 1'b1;
    #(50 * CLK_PERIOD);
    i_rst = 1'b0;
    #(50 * CLK_PERIOD);

    // Scan data_in and feed the filter
    for (idx_fx = 0; idx_fx < NData; idx_fx = idx_fx + 1) begin
      @(posedge top_tb.top_simulink_i.clk_lo);
    end

    $finish;
  end

  assign i_real = data_real[idx_fx];
  assign i_imag = data_imag[idx_fx];


  //----------------- Generate Differential Clock -------------------//
  initial i_clk_p = 1'b1;
  always #(CLK_PERIOD / 2) i_clk_p = !i_clk_p;

  assign i_clk_n = !i_clk_p;

  
  //----------------- Save output data to a file -------------------//
  integer file_1, file_2, file_3, file_4;

  initial begin
    file_1 = $fopen(Real_Sim, "w");
    file_2 = $fopen(Imag_Sim, "w");
    file_3 = $fopen(Real_Ver, "w");
    file_4 = $fopen(Imag_Ver, "w");
    if (file_1 == 0 || file_2 == 0 || file_3 == 0 || file_4 == 0) begin
      $display("Error abriendo el archivo.");
      $finish;
    end

    for (idx_fc = 0; idx_fc < NData * R; idx_fc = idx_fc + 1) begin
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


endmodule
