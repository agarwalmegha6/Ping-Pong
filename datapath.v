`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:49 05/04/2015 
// Design Name: 
// Module Name:    datapath 
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
module datapath(d_clk,d_t1_clr,d_t1_ld,d_t2_clr,d_t2_ld,d_c_clr,d_c_ld,d_d_clr,d_d_ld,d_cmux_sel,d_dmux_sel,d_ra_sel,d_wd_sel,d_n,d_rdata,d_cltn1,d_dvalgt0,d_t1ltt2,d_wd_val,d_d_add);

input[7:0] d_rdata;
input[7:0] d_n;
input d_clk,d_t1_clr,d_t1_ld,d_t2_clr,d_t2_ld,d_c_clr,d_c_ld,d_d_clr,d_d_ld,d_cmux_sel,d_dmux_sel,d_ra_sel,d_wd_sel;

wire [7:0] d_c_input,d_d_input,d_c_output,d_d_output,d_t1_output,d_t2_output,d_inc_output,d_dec_output,d_val;

output [7:0] d_wd_val;
output d_dvalgt0,d_cltn1,d_t1ltt2;
output [4:0] d_d_add;

mux2 c_mux(8'd1,d_inc_output,d_cmux_sel,d_c_input);
mux2 d_mux(d_c_output,d_dec_output,d_dmux_sel,d_d_input);
mux2 ra_mux(d_d_output,d_dec_output,d_ra_sel,d_val);
mux2 wd_mux(d_t2_output,d_t1_output,d_wd_sel,d_wd_val); // Change

dp_reg c_reg(d_c_input,d_c_output,d_clk,d_c_clr,d_c_ld);
dp_reg d_reg(d_d_input,d_d_output,d_clk,d_d_clr,d_d_ld);
dp_reg t1_reg(d_rdata,d_t1_output,d_clk,d_t1_clr,d_t1_ld);
dp_reg t2_reg(d_rdata,d_t2_output,d_clk,d_t2_clr,d_t2_ld);

inc c_inc(d_c_output,d_inc_output);
dec d_dec(d_d_output,d_dec_output);
cltn my_cltn(d_c_output,d_n,d_cltn1);
dgtzero my_dgtzero(d_d_output,8'd0,d_dvalgt0);
t1ltt2 my_t1ltt2(d_t1_output,d_t2_output,d_t1ltt2);

assign d_d_add = d_val;

endmodule
