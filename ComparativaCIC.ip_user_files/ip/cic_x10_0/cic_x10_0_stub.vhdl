-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon Apr  7 16:11:51 2025
-- Host        : DESKTOP-EO6KBCT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top cic_x10_0 -prefix
--               cic_x10_0_ cic_x10_bd_cic_x10_1_0_stub.vhdl
-- Design      : cic_x10_bd_cic_x10_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z045ffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cic_x10_0 is
  Port ( 
    imag_fs : in STD_LOGIC_VECTOR ( 15 downto 0 );
    real_fs : in STD_LOGIC_VECTOR ( 15 downto 0 );
    rst_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk : in STD_LOGIC;
    imag_fc : out STD_LOGIC_VECTOR ( 15 downto 0 );
    real_fc : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end cic_x10_0;

architecture stub of cic_x10_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "imag_fs[15:0],real_fs[15:0],rst_n[0:0],clk,imag_fc[15:0],real_fc[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "cic_x10,Vivado 2021.2";
begin
end;
