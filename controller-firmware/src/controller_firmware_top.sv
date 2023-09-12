`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Excessive Overkill
// Engineer: Stacey Hdlforbeginners
// 
// Create Date: 08/12/2023 10:50:04 AM
// Design Name: Controller Software
// Module Name: controller_firmware
// Project Name: Excessive Motion
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller_firmware_top
  (

   inout [14:0]	DDR_addr,
   inout [2:0]	DDR_ba,
   inout	DDR_cas_n,
   inout	DDR_ck_n,
   inout	DDR_ck_p,
   inout	DDR_cke,
   inout	DDR_cs_n,
   inout [3:0]	DDR_dm,
   inout [31:0]	DDR_dq,
   inout [3:0]	DDR_dqs_n,
   inout [3:0]	DDR_dqs_p,
   inout	DDR_odt,
   inout	DDR_ras_n,
   inout	DDR_reset_n,
   inout	DDR_we_n,
   inout	FIXED_IO_ddr_vrn,
   inout	FIXED_IO_ddr_vrp,
   inout [53:0]	FIXED_IO_mio,
   inout	FIXED_IO_ps_clk,
   inout	FIXED_IO_ps_porb,
   inout	FIXED_IO_ps_srstb,
   output [3:0]	leds_4bits_tri_o,
   input [3:0]	sws_4bits_tri_i


   );
   
   controller_firmware_wrapper controller_firmware_wrapper_i
     (
      
      .DDR_addr(DDR_addr),
      .DDR_ba(DDR_ba),
      .DDR_cas_n(DDR_cas_n),
      .DDR_ck_n(DDR_ck_n),
      .DDR_ck_p(DDR_ck_p),
      .DDR_cke(DDR_cke),
      .DDR_cs_n(DDR_cs_n),
      .DDR_dm(DDR_dm),
      .DDR_dq(DDR_dq),
      .DDR_dqs_n(DDR_dqs_n),
      .DDR_dqs_p(DDR_dqs_p),
      .DDR_odt(DDR_odt),
      .DDR_ras_n(DDR_ras_n),
      .DDR_reset_n(DDR_reset_n),
      .DDR_we_n(DDR_we_n),
      .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
      .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
      .FIXED_IO_mio(FIXED_IO_mio),
      .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
      .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
      .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
      .leds_4bits_tri_o(leds_4bits_tri_o),
      .sws_4bits_tri_i(sws_4bits_tri_i)

      );
   
endmodule
