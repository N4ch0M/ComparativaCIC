// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Fri Apr  4 20:25:20 2025
// Host        : OFICINA-HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Documentos/Xilinx/FILTROS/ComparativaCIC/ComparativaCIC.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z045ffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_hi, clk_lo, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_hi,clk_lo,clk_in1_p,clk_in1_n" */;
  output clk_hi;
  output clk_lo;
  input clk_in1_p;
  input clk_in1_n;
endmodule
