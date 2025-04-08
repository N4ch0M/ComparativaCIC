-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_6 \
  "../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/cic_compiler_v4_0_15 \
  "../../../ipstatic/hdl/cic_compiler_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ip/cic_x10_0/cic_x10_cic_compiler_v4_0_i0/sim/cic_x10_cic_compiler_v4_0_i0.vhd" \
-endlib
-makelib xcelium_lib/fir_compiler_v7_2_17 \
  "../../../ipstatic/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ip/cic_x10_0/cic_x10_fir_compiler_v7_2_i0/sim/cic_x10_fir_compiler_v7_2_i0.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_17 \
  "../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ip/cic_x10_0/cic_x10_mult_gen_v12_0_i0/sim/cic_x10_mult_gen_v12_0_i0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../ipstatic/work/hdl/synth_reg.v" \
  "../../../ipstatic/work/hdl/synth_reg_w_init.v" \
  "../../../ipstatic/work/hdl/convert_type.v" \
  "../../../ipstatic/work/hdl/xlclockdriver_rd.v" \
  "../../../ipstatic/work/hdl/cic_x10_entity_declarations.v" \
  "../../../ipstatic/work/hdl/cic_x10.v" \
  "../../../ip/cic_x10_0/sim/cic_x10_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

