`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:07 05/04/2015 
// Design Name: 
// Module Name:    sort_top 
// Project Name: 
// Target Devices:
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sort_top(t_s_go,t_s_rst,t_clk,t_n,t_rdata,t_d_add,t_wd_val,t_s_dmw,t_s_dmr);

input t_s_go,t_s_rst,t_clk;
input [7:0] t_rdata,t_n;
output [7:0] t_wd_val;
output [4:0] t_d_add;
output t_s_dmw,t_s_dmr;

wire t_cltn1,t_dvalgt0,t_t1ltt2,t_s_dmw,t_s_dmr,t_t1_clr,t_t1_ld,t_t2_clr,t_t2_ld,t_c_clr,t_c_ld,t_cmux_sel,t_dmux_sel,t_ra_sel,t_wd_sel;

controller control(t_clk,t_s_rst,t_s_go,t_cltn1,t_dvalgt0,t_t1ltt2,t_s_dmw,t_s_dmr,t_t1_clr,t_t1_ld,t_t2_clr,t_t2_ld,t_c_clr,t_c_ld,t_d_clr,t_d_ld,t_cmux_sel,t_dmux_sel,t_ra_sel,t_wd_sel);

datapath dp(t_clk,t_t1_clr,t_t1_ld,t_t2_clr,t_t2_ld,t_c_clr,t_c_ld,t_d_clr,t_d_ld,t_cmux_sel,t_dmux_sel,t_ra_sel,t_wd_sel,t_n,t_rdata,t_cltn1,t_dvalgt0,t_t1ltt2,t_wd_val,t_d_add);

endmodule
