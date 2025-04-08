`ifndef xlConvPkgIncluded
`include "conv_pkg.v"
`endif

`timescale 1 ns / 10 ps
// Generated from Simulink block CIC_x10_struct
module cic_x10_struct (
  input [16-1:0] imag_fs,
  input [16-1:0] real_fs,
  input [1-1:0] rst_n,
  input clk_1,
  input ce_1,
  input clk_10,
  input ce_10,
  output [16-1:0] imag_fc,
  output [16-1:0] real_fc
);
  wire [16-1:0] imag_fc_reg_q_net;
  wire [16-1:0] imag_fs_net;
  wire rst_n_reg_q_net;
  wire [16-1:0] real_fs_net;
  wire cic_compiler_4_1_s_axis_data_tready_net;
  wire clk_net;
  wire cic_compiler_4_1_m_axis_data_tvalid_net;
  wire ce_net;
  wire [23-1:0] cic_compiler_4_1_m_axis_data_tdata_real_net;
  wire [16-1:0] fir_real_reg_q_net;
  wire [16-1:0] fir_imag_reg_q_net;
  wire [16-1:0] cmult_p_net;
  wire [23-1:0] shift_op_net;
  wire clk_10_net;
  wire cic_compiler_4_2_s_axis_data_tready_net;
  wire ce_10_net;
  wire cic_compiler_4_2_m_axis_data_tvalid_net;
  wire [16-1:0] real_fc_reg_q_net;
  wire [1-1:0] rst_n_net;
  wire [23-1:0] cic_compiler_4_2_m_axis_data_tdata_real_net;
  wire [23-1:0] shift1_op_net;
  wire fir_compiler_7_2_s_axis_data_tready_net;
  wire [33-1:0] fir_compiler_7_2_m_axis_data_tdata_real_net;
  wire [1-1:0] register11_q_net;
  wire fir_compiler_7_1_m_axis_data_tvalid_net;
  wire [16-1:0] real_reg_q_net;
  wire fir_compiler_7_2_m_axis_data_tvalid_net;
  wire [33-1:0] fir_compiler_7_1_m_axis_data_tdata_real_net;
  wire [16-1:0] cmult1_p_net;
  wire [16-1:0] imag_reg_q_net;
  wire fir_compiler_7_1_s_axis_data_tready_net;
  wire [1-1:0] register13_q_net;
  wire [16-1:0] fir_real_cast_dout_net;
  wire [23-1:0] cic_real_reg_q_net;
  wire [16-1:0] fir_imag_cast_dout_net;
  wire [23-1:0] cic_imag_reg_q_net;
  assign imag_fc = imag_fc_reg_q_net;
  assign imag_fs_net = imag_fs;
  assign real_fc = real_fc_reg_q_net;
  assign real_fs_net = real_fs;
  assign rst_n_net = rst_n;
  assign clk_net = clk_1;
  assign ce_net = ce_1;
  assign clk_10_net = clk_10;
  assign ce_10_net = ce_10;
  xlcic_compiler_a98e2825711f2322c7878c5b8c46f6c6 cic_compiler_4_1 (
    .s_axis_data_tdata_real(fir_imag_reg_q_net),
    .rst(rst_n_reg_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .clk_10(clk_10_net),
    .ce_10(ce_10_net),
    .clk_logic_10(clk_10_net),
    .ce_logic_10(ce_10_net),
    .s_axis_data_tready(cic_compiler_4_1_s_axis_data_tready_net),
    .m_axis_data_tvalid(cic_compiler_4_1_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(cic_compiler_4_1_m_axis_data_tdata_real_net)
  );
  xlcic_compiler_a98e2825711f2322c7878c5b8c46f6c6 cic_compiler_4_2 (
    .s_axis_data_tdata_real(fir_real_reg_q_net),
    .rst(rst_n_reg_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .clk_10(clk_10_net),
    .ce_10(ce_10_net),
    .clk_logic_10(clk_10_net),
    .ce_logic_10(ce_10_net),
    .s_axis_data_tready(cic_compiler_4_2_s_axis_data_tready_net),
    .m_axis_data_tvalid(cic_compiler_4_2_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(cic_compiler_4_2_m_axis_data_tdata_real_net)
  );
  cic_x10_xlcmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(15),
    .a_width(23),
    .b_bin_pt(15),
    .c_a_type(0),
    .c_a_width(23),
    .c_b_type(1),
    .c_b_width(16),
    .c_output_width(39),
    .core_name0("cic_x10_mult_gen_v12_0_i0"),
    .extra_registers(0),
    .multsign(2),
    .overflow(1),
    .p_arith(`xlSigned),
    .p_bin_pt(14),
    .p_width(16),
    .quantization(1),
    .zero_const(0)
  )
  cmult (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(shift_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(cmult_p_net)
  );
  cic_x10_xlcmult #(
    .a_arith(`xlSigned),
    .a_bin_pt(15),
    .a_width(23),
    .b_bin_pt(15),
    .c_a_type(0),
    .c_a_width(23),
    .c_b_type(1),
    .c_b_width(16),
    .c_output_width(39),
    .core_name0("cic_x10_mult_gen_v12_0_i0"),
    .extra_registers(0),
    .multsign(2),
    .overflow(1),
    .p_arith(`xlSigned),
    .p_bin_pt(14),
    .p_width(16),
    .quantization(1),
    .zero_const(0)
  )
  cmult1 (
    .clr(1'b0),
    .core_clr(1'b1),
    .en(1'b1),
    .rst(1'b0),
    .a(shift1_op_net),
    .clk(clk_net),
    .ce(ce_net),
    .core_clk(clk_net),
    .core_ce(ce_net),
    .p(cmult1_p_net)
  );
  xlfir_compiler_f7f0ebca9a02701da4711e4925863a31 fir_compiler_7_1 (
    .s_axis_data_tdata_real(imag_reg_q_net),
    .rst(rst_n_reg_q_net),
    .src_clk(clk_net),
    .src_ce(ce_net),
    .clk(clk_net),
    .ce(ce_net),
    .clk_10(clk_10_net),
    .ce_10(ce_10_net),
    .clk_logic_10(clk_10_net),
    .ce_logic_10(ce_10_net),
    .s_axis_data_tready(fir_compiler_7_1_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_compiler_7_1_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_compiler_7_1_m_axis_data_tdata_real_net)
  );
  xlfir_compiler_f7f0ebca9a02701da4711e4925863a31 fir_compiler_7_2 (
    .s_axis_data_tdata_real(real_reg_q_net),
    .rst(rst_n_reg_q_net),
    .src_clk(clk_net),
    .src_ce(ce_net),
    .clk(clk_net),
    .ce(ce_net),
    .clk_10(clk_10_net),
    .ce_10(ce_10_net),
    .clk_logic_10(clk_10_net),
    .ce_logic_10(ce_10_net),
    .s_axis_data_tready(fir_compiler_7_2_s_axis_data_tready_net),
    .m_axis_data_tvalid(fir_compiler_7_2_m_axis_data_tvalid_net),
    .m_axis_data_tdata_real(fir_compiler_7_2_m_axis_data_tdata_real_net)
  );
  cic_x10_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register11 (
    .en(1'b1),
    .rst(1'b0),
    .d(cic_compiler_4_1_m_axis_data_tvalid_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register11_q_net)
  );
  cic_x10_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  register13 (
    .en(1'b1),
    .rst(1'b0),
    .d(cic_compiler_4_2_m_axis_data_tvalid_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(register13_q_net)
  );
  sysgen_shift_a5a7fbd1a7 shift (
    .clr(1'b0),
    .ip(cic_real_reg_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(shift_op_net)
  );
  sysgen_shift_a5a7fbd1a7 shift1 (
    .clr(1'b0),
    .ip(cic_imag_reg_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .op(shift1_op_net)
  );
  cic_x10_xlregister #(
    .d_width(23),
    .init_value(23'b00000000000000000000000)
  )
  cic_imag_reg (
    .en(1'b1),
    .rst(1'b0),
    .d(cic_compiler_4_1_m_axis_data_tdata_real_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(cic_imag_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(23),
    .init_value(23'b00000000000000000000000)
  )
  cic_real_reg (
    .en(1'b1),
    .rst(1'b0),
    .d(cic_compiler_4_2_m_axis_data_tdata_real_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(cic_real_reg_q_net)
  );
  cic_x10_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(31),
    .din_width(33),
    .dout_arith(2),
    .dout_bin_pt(15),
    .dout_width(16),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlRound)
  )
  fir_imag_cast (
    .clr(1'b0),
    .en(1'b1),
    .din(fir_compiler_7_1_m_axis_data_tdata_real_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .dout(fir_imag_cast_dout_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  fir_imag_reg (
    .rst(1'b0),
    .d(fir_imag_cast_dout_net),
    .en(fir_compiler_7_1_m_axis_data_tvalid_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .q(fir_imag_reg_q_net)
  );
  cic_x10_xlconvert #(
    .bool_conversion(0),
    .din_arith(2),
    .din_bin_pt(31),
    .din_width(33),
    .dout_arith(2),
    .dout_bin_pt(15),
    .dout_width(16),
    .latency(0),
    .overflow(`xlWrap),
    .quantization(`xlRound)
  )
  fir_real_cast (
    .clr(1'b0),
    .en(1'b1),
    .din(fir_compiler_7_2_m_axis_data_tdata_real_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .dout(fir_real_cast_dout_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  fir_real_reg (
    .rst(1'b0),
    .d(fir_real_cast_dout_net),
    .en(fir_compiler_7_2_m_axis_data_tvalid_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .q(fir_real_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  imag_fc_reg (
    .rst(1'b0),
    .d(cmult1_p_net),
    .en(register11_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(imag_fc_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  imag_reg (
    .en(1'b1),
    .rst(1'b0),
    .d(imag_fs_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .q(imag_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  real_fc_reg (
    .rst(1'b0),
    .d(cmult_p_net),
    .en(register13_q_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(real_fc_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(16),
    .init_value(16'b0000000000000000)
  )
  real_reg (
    .en(1'b1),
    .rst(1'b0),
    .d(real_fs_net),
    .clk(clk_10_net),
    .ce(ce_10_net),
    .q(real_reg_q_net)
  );
  cic_x10_xlregister #(
    .d_width(1),
    .init_value(1'b0)
  )
  rst_n_reg (
    .en(1'b1),
    .rst(1'b0),
    .d(rst_n_net),
    .clk(clk_net),
    .ce(ce_net),
    .q(rst_n_reg_q_net)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
module cic_x10_default_clock_driver (
  input cic_x10_sysclk,
  input cic_x10_sysce,
  input cic_x10_sysclr,
  output cic_x10_clk1,
  output cic_x10_ce1,
  output cic_x10_clk10,
  output cic_x10_ce10
);
  xlclockdriver #(
    .period(1),
    .log_2_period(1)
  )
  clockdriver_x0 (
    .sysclk(cic_x10_sysclk),
    .sysce(cic_x10_sysce),
    .sysclr(cic_x10_sysclr),
    .clk(cic_x10_clk1),
    .ce(cic_x10_ce1)
  );
  xlclockdriver #(
    .period(10),
    .log_2_period(4)
  )
  clockdriver (
    .sysclk(cic_x10_sysclk),
    .sysce(cic_x10_sysce),
    .sysclr(cic_x10_sysclr),
    .clk(cic_x10_clk10),
    .ce(cic_x10_ce10)
  );
endmodule
`timescale 1 ns / 10 ps
// Generated from Simulink block 
(* core_generation_info = "cic_x10,sysgen_core_2021_2,{,compilation=IP Catalog,block_icon_display=Default,family=zynq,part=xc7z045,speed=-2,package=ffg900,synthesis_language=verilog,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=1,ce_clr=0,clock_period=12.987,system_simulink_period=192,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=1.96416e+06,cic_compiler_v4_0=2,cmult=2,convert=2,fir_compiler_v7_2=2,register=11,shift=2,}" *)
module cic_x10 (
  input [16-1:0] imag_fs,
  input [16-1:0] real_fs,
  input [1-1:0] rst_n,
  input clk,
  output [16-1:0] imag_fc,
  output [16-1:0] real_fc
);
  wire clk_10_net;
  wire ce_10_net;
  wire ce_1_net;
  wire clk_1_net;
  cic_x10_default_clock_driver cic_x10_default_clock_driver (
    .cic_x10_sysclk(clk),
    .cic_x10_sysce(1'b1),
    .cic_x10_sysclr(1'b0),
    .cic_x10_clk1(clk_1_net),
    .cic_x10_ce1(ce_1_net),
    .cic_x10_clk10(clk_10_net),
    .cic_x10_ce10(ce_10_net)
  );
  cic_x10_struct cic_x10_struct (
    .imag_fs(imag_fs),
    .real_fs(real_fs),
    .rst_n(rst_n),
    .clk_1(clk_1_net),
    .ce_1(ce_1_net),
    .clk_10(clk_10_net),
    .ce_10(ce_10_net),
    .imag_fc(imag_fc),
    .real_fc(real_fc)
  );
endmodule
