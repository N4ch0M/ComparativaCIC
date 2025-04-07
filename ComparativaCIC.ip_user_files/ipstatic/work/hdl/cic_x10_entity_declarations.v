//-----------------------------------------------------------------
// System Generator version 2021.2 Verilog source file.
//
// Copyright(C) 2021 by Xilinx, Inc.  All rights reserved.  This
// text/file contains proprietary, confidential information of Xilinx,
// Inc., is distributed under license from Xilinx, Inc., and may be used,
// copied and/or disclosed only pursuant to the terms of a valid license
// agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
// this text/file solely for design, simulation, implementation and
// creation of design files limited to Xilinx devices or technologies.
// Use with non-Xilinx devices or technologies is expressly prohibited
// and immediately terminates your license unless covered by a separate
// agreement.
//
// Xilinx is providing this design, code, or information "as is" solely
// for use in developing programs and solutions for Xilinx devices.  By
// providing this design, code, or information as one possible
// implementation of this feature, application or standard, Xilinx is
// making no representation that this implementation is free from any
// claims of infringement.  You are responsible for obtaining any rights
// you may require for your implementation.  Xilinx expressly disclaims
// any warranty whatsoever with respect to the adequacy of the
// implementation, including but not limited to warranties of
// merchantability or fitness for a particular purpose.
//
// Xilinx products are not intended for use in life support appliances,
// devices, or systems.  Use in such applications is expressly prohibited.
//
// Any modifications that are made to the source code are done at the user's
// sole risk and will be unsupported.
//
// This copyright and support notice must be retained as part of this
// text at all times.  (c) Copyright 1995-2021 Xilinx, Inc.  All rights
// reserved.
//-----------------------------------------------------------------

`include "conv_pkg.v"
`timescale 1 ns / 10 ps


module cic_x10_xlconvert (din, clk, ce, clr, en, dout);

//Parameter Definitions
   parameter din_width= 16;
   parameter din_bin_pt= 4;
   parameter din_arith= `xlUnsigned;
   parameter dout_width= 8;
   parameter dout_bin_pt= 2;
   parameter dout_arith= `xlUnsigned;
   parameter en_width = 1;
   parameter en_bin_pt = 0;
   parameter en_arith = `xlUnsigned;
   parameter bool_conversion = 0;
   parameter latency = 0;
   parameter quantization= `xlTruncate;
   parameter overflow= `xlWrap;

//Port Declartions
   input [din_width-1:0] din;
   input clk, ce, clr;
   input [en_width-1:0] en;
   output [dout_width-1:0] dout;

//Wire Declartions
   wire [dout_width-1:0]   result;
   wire internal_ce;
   assign internal_ce = ce & en[0];

generate
 if (bool_conversion == 1)
    begin:bool_converion_generate
       assign result = din;
    end
 else
    begin:std_conversion
       convert_type #(din_width,
                      din_bin_pt,
                      din_arith,
		              dout_width,
                      dout_bin_pt,
                      dout_arith,
                      quantization,
                      overflow)
        conv_udp (.inp(din), .res(result));
    end
endgenerate

generate
if (latency > 0)
     begin:latency_test
	synth_reg # (dout_width, latency)
	  reg1 (
	       .i(result),
	       .ce(internal_ce),
	       .clr(clr),
	       .clk(clk),
	       .o(dout));
     end
else
     begin:latency0
	assign dout = result;
     end
endgenerate

endmodule

`timescale 1 ns / 10 ps
module cic_x10_xlregister (d, rst, en, ce, clk, q);
   parameter d_width = 5;
   parameter init_value = 'b0;

   input [d_width-1:0] d;
   input rst, en, ce, clk;
   output [d_width-1:0] q;

   wire internal_clr, internal_ce;

   assign internal_clr = rst & ce;
   assign internal_ce  = ce & en;

   synth_reg_w_init #(.width(d_width),
                      .init_index(2),
                      .init_value(init_value),
                      .latency(1))
   synth_reg_inst(.i(d),
                  .ce(internal_ce),
                  .clr(internal_clr),
                  .clk(clk),
                  .o(q));
endmodule

`timescale 1 ns / 10 ps
module sysgen_shift_a5a7fbd1a7 (
  input [(23 - 1):0] ip,
  output [(23 - 1):0] op,
  input clk,
  input ce,
  input clr);
  wire signed [(23 - 1):0] ip_1_23;
  localparam signed [(23 - 1):0] const_value = 23'sb00000000000000000000000;
  reg signed [(23 - 1):0] op_mem_46_20[0:(1 - 1)];
  initial
    begin
      op_mem_46_20[0] = 23'b00000000000000000000000;
    end
  wire signed [(23 - 1):0] op_mem_46_20_front_din;
  wire signed [(23 - 1):0] op_mem_46_20_back;
  wire op_mem_46_20_push_front_pop_back_en;
  localparam [(1 - 1):0] const_value_x_000000 = 1'b1;
  wire signed [(23 - 1):0] cast_internal_ip_36_3_convert;
  assign ip_1_23 = ip;
  assign op_mem_46_20_back = op_mem_46_20[0];
  always @(posedge clk)
    begin:proc_op_mem_46_20
      integer i;
      if (((ce == 1'b1) && (op_mem_46_20_push_front_pop_back_en == 1'b1)))
        begin
          op_mem_46_20[0] <= op_mem_46_20_front_din;
        end
    end
  assign cast_internal_ip_36_3_convert = {{6{ip_1_23[22]}}, ip_1_23[22:6]};
  assign op_mem_46_20_push_front_pop_back_en = 1'b0;
  assign op = cast_internal_ip_36_3_convert;
endmodule
module cic_x10_xlcmult (a, ce, clr, clk, core_ce, core_clr, core_clk, rst, en, p);
 
 parameter core_name0= "";
 parameter a_width= 4;
 parameter a_bin_pt= 2;
 parameter a_arith= `xlSigned;
 parameter b_width= 4;
 parameter b_bin_pt= 2;
 parameter b_arith= `xlSigned;
 parameter p_width= 8;
 parameter p_bin_pt= 2;
 parameter p_arith= `xlSigned;
 parameter rst_width= 1;
 parameter rst_bin_pt= 0;
 parameter rst_arith= `xlUnsigned;
 parameter en_width= 1;
 parameter en_bin_pt= 0;
 parameter en_arith= `xlUnsigned;
 parameter multsign= `xlSigned;
 parameter quantization= `xlTruncate;
 parameter overflow= `xlWrap;
 parameter extra_registers= 0;
 parameter c_a_width= 7;
 parameter c_b_width= 7;
 parameter c_a_type= 0;
 parameter c_b_type= 0;
 parameter c_type= 0;
 parameter const_bin_pt= 1;
 parameter c_output_width= 16;
 parameter zero_const = 0;
 
 input [a_width-1:0] a;
 input  ce;
 input  clr;
 input  clk;
 input  core_ce;
 input  core_clr;
 input  core_clk;
 input [rst_width-1:0] rst;
 input [en_width-1:0] en;
 output [p_width-1:0] p;
 
 wire [c_a_width-1:0] #0.1 tmp_a;
 wire [c_output_width-1:0] tmp_p;
 wire [p_width-1:0] conv_p;
 wire  real_a,real_p;
 wire  nd;
 wire  internal_ce;
 wire  internal_clr;
 wire  internal_core_ce;
 
 assign internal_ce = ce & en[0];
 assign internal_core_ce = core_ce & en[0];
 assign internal_clr = (clr | rst[0]) & ce;
 assign nd = internal_ce;
 
 zero_ext # (a_width,c_a_width) zero_ext_a(.inp(a),.res(tmp_a));
 
 convert_type # (c_output_width, a_bin_pt+b_bin_pt, multsign,
                            p_width, p_bin_pt, p_arith, quantization, overflow)
 convert_p(.inp(tmp_p),.res(conv_p));
 
 generate



if (core_name0 == "cic_x10_mult_gen_v12_0_i0") 
     begin:comp0
cic_x10_mult_gen_v12_0_i0 core_instance0 ( 
      .P(tmp_p),
      .A(tmp_a) 
       ); 
     end 

 endgenerate
 
 generate
  if ((extra_registers > 0) && (zero_const == 0))
      begin:latency_gt_0
 	synth_reg # (p_width, extra_registers) 
 	  reg1 (
 	       .i(conv_p), 
 	       .ce(internal_ce),
 	       .clr(internal_clr),
 	       .clk(clk),
 	       .o(p)
                );
      end
     
    if ((extra_registers == 0) && (zero_const == 0))
      begin:latency_eq_0
 	assign p = conv_p;
      end
 
    if (zero_const == 1)
      begin:zero_constant
 	assign p = {p_width{1'b0}};
      end
 endgenerate
 
 endmodule


`timescale 1 ns / 10 ps
module  xlcic_compiler_a84f534b3cc58f1caa9dc6578992cae4 (ce,ce_2,ce_20,ce_logic_20,clk,clk_2,clk_20,clk_logic_20,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready);

input ce;
input ce_2;
input ce_20;
input ce_logic_20;
input clk;
input clk_2;
input clk_20;
input clk_logic_20;
output[22:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
wire aresetn_net;
wire[23:0] m_axis_data_tdata_net;
wire[22:0] m_axis_data_tdata_real_ps_net;
wire[22:0] m_axis_data_tdata_real_ps_net_captured;
wire[22:0] m_axis_data_tdata_real_ps_net_or_captured_net;
wire m_axis_data_tvalid_ps_net;
wire m_axis_data_tvalid_ps_net_captured;
wire m_axis_data_tvalid_ps_net_or_captured_net;
wire[15:0] s_axis_data_tdata_net;
wire internal_rst_2_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real_ps_net = m_axis_data_tdata_net[22 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  assign internal_rst_2_net = (~ rst) & ce_2;
  assign m_axis_data_tdata_real_ps_net_or_captured_net = m_axis_data_tdata_real_ps_net | m_axis_data_tdata_real_ps_net_captured;
synth_reg_w_init # (
        .width (23),
        .init_index(0),
        .init_value('b0),
        .latency(1))
m_axis_data_tdata_real_ps_net_synchronizer_1 (
        .i(m_axis_data_tdata_real_ps_net_or_captured_net),
        .ce(ce_2),
        .clr(internal_rst_2_net),
        .clk(clk_2), 
        .o(m_axis_data_tdata_real)
    );
synth_reg_w_init # (
        .width(23),
        .init_index(0),
        .init_value('b0),
        .latency(1)
    )
m_axis_data_tdata_real_ps_net_synchronizer_2 (
        .i(m_axis_data_tdata_real_ps_net),
        .ce(m_axis_data_tvalid_ps_net),
        .clr(internal_rst_2_net),
        .clk(clk_2), 
        .o(m_axis_data_tdata_real_ps_net_captured)
    );

  assign m_axis_data_tvalid_ps_net_or_captured_net = m_axis_data_tvalid_ps_net || m_axis_data_tvalid_ps_net_captured;
synth_reg_w_init # (
        .width (1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1))
m_axis_data_tvalid_ps_net_synchronizer_1 (
        .i(m_axis_data_tvalid_ps_net_or_captured_net),
        .ce(ce_2),
        .clr(internal_rst_2_net),
        .clk(clk_2), 
        .o(m_axis_data_tvalid)
    );
synth_reg_w_init # (
        .width(1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1)
    )
m_axis_data_tvalid_ps_net_synchronizer_2 (
        .i(1'b1),
        .ce(m_axis_data_tvalid_ps_net),
        .clr(internal_rst_2_net),
        .clk(clk_2), 
        .o(m_axis_data_tvalid_ps_net_captured)
    );

  cic_x10_cic_compiler_v4_0_i0 cic_x10_cic_compiler_v4_0_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid_ps_net),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(ce_logic_20)
    );

 endmodule



`timescale 1 ns / 10 ps
module  xlfir_compiler_544235f8561a15c6184741340b8d6da7 (ce,ce_20,ce_logic_20,clk,clk_20,clk_logic_20,m_axis_data_tdata_real,m_axis_data_tvalid,rst,s_axis_data_tdata_real,s_axis_data_tready,src_ce,src_clk);

input ce;
input ce_20;
input ce_logic_20;
input clk;
input clk_20;
input clk_logic_20;
output[32:0] m_axis_data_tdata_real;
output m_axis_data_tvalid;
input rst;
input[15:0] s_axis_data_tdata_real;
output s_axis_data_tready;
input src_ce;
input src_clk;
wire aresetn_net;
wire[39:0] m_axis_data_tdata_net;
wire[32:0] m_axis_data_tdata_real_ps_net;
wire m_axis_data_tvalid_ps_net;
wire m_axis_data_tvalid_ps_net_captured;
wire m_axis_data_tvalid_ps_net_or_captured_net;
wire[15:0] s_axis_data_tdata_net;
wire internal_rst_20_net;
  assign aresetn_net = rst | (~ ce);
  assign m_axis_data_tdata_real_ps_net = m_axis_data_tdata_net[32 : 0];
  assign s_axis_data_tdata_net[15 : 0] = s_axis_data_tdata_real;
  assign internal_rst_20_net = (~ rst) & ce_20;
  synth_reg_w_init # (.width(33),
                  .init_index(0),
                  .init_value('b0),
                  .latency(1))
m_axis_data_tdata_real_ps_net_synchronizer (.i(m_axis_data_tdata_real_ps_net),
             .ce(ce_20),
             .clr(internal_rst_20_net),
             .clk(clk_20),
             .o(m_axis_data_tdata_real));

  assign m_axis_data_tvalid_ps_net_or_captured_net = m_axis_data_tvalid_ps_net || m_axis_data_tvalid_ps_net_captured;
synth_reg_w_init # (
        .width (1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1))
m_axis_data_tvalid_ps_net_synchronizer_1 (
        .i(m_axis_data_tvalid_ps_net_or_captured_net),
        .ce(ce_20),
        .clr(internal_rst_20_net),
        .clk(clk_20), 
        .o(m_axis_data_tvalid)
    );
synth_reg_w_init # (
        .width(1),
        .init_index(0),
        .init_value(1'b0),
        .latency(1)
    )
m_axis_data_tvalid_ps_net_synchronizer_2 (
        .i(1'b1),
        .ce(m_axis_data_tvalid_ps_net),
        .clr(internal_rst_20_net),
        .clk(clk_20), 
        .o(m_axis_data_tvalid_ps_net_captured)
    );

  cic_x10_fir_compiler_v7_2_i0 cic_x10_fir_compiler_v7_2_i0_instance(
      .aclk(clk),
      .aclken(ce),
      .aresetn(aresetn_net),
      .m_axis_data_tdata(m_axis_data_tdata_net),
      .m_axis_data_tvalid(m_axis_data_tvalid_ps_net),
      .s_axis_data_tdata(s_axis_data_tdata_net),
      .s_axis_data_tready(s_axis_data_tready),
      .s_axis_data_tvalid(ce_logic_20)
    );

 endmodule



