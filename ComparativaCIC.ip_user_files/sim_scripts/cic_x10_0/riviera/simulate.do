onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+cic_x10_0 -L xpm -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L cic_compiler_v4_0_15 -L xil_defaultlib -L fir_compiler_v7_2_17 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_17 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.cic_x10_0 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {cic_x10_0.udo}

run -all

endsim

quit -force
