`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:07 05/04/2015 
// Design Name: 
// Module Name:    controller 
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
module controller(c_clk,c_s_rst,c_s_go,c_cltn1,c_dvalgt0,c_t1ltt2,c_s_dmw,c_s_dmr,c_t1_clr,c_t1_ld,c_t2_clr,c_t2_ld,c_c_clr,c_c_ld,c_d_clr,c_d_ld,c_cmux_sel,c_dmux_sel,c_ra_sel,c_wd_sel);

input c_clk,c_s_rst,c_s_go,c_dvalgt0,c_t1ltt2,c_cltn1;
output reg c_cmux_sel,c_dmux_sel,c_ra_sel,c_wd_sel,c_s_dmr,c_s_dmw,c_t1_ld,c_t2_ld,c_c_clr,c_c_ld,c_d_clr,c_d_ld,c_t1_clr,c_t2_clr;

reg [3:0] state, nstate;
parameter [3:0] s_wait=0, s_c_init=1, s_c_check=2,s_d_init=3,s_read1=4,s_read2=5,s_compare=6,s_incr1=7, s_incr2=8, s_write1=9, s_write2=10,s_check1=11,s_check2=12;

always@(state,c_s_go,c_dvalgt0,c_t1ltt2,c_cltn1) begin
case(state)

s_wait: begin
if(c_s_go == 0)
nstate<=s_wait;
else
nstate <= s_c_init;
end

s_c_init: begin
c_cmux_sel<=0;
c_c_ld<=1;
nstate<=s_c_check;
end

s_c_check: begin
c_c_ld<=0;
if(c_cltn1==1)
nstate <= s_d_init;
else
nstate <= s_wait;
end

s_d_init: begin
c_dmux_sel<=0;
c_d_ld<=1;
nstate<=s_read1;
end

s_read1: begin
c_d_ld<=0;
c_ra_sel<=0;
c_s_dmr<=1;
c_t1_ld<=1;
nstate <= s_read2;
end

s_read2: begin
c_ra_sel<=1;
c_s_dmr<=1;
c_t2_ld<=1;
c_t1_ld<=0;
nstate<=s_compare;
end

s_compare: begin
c_t2_ld<=0;
if(c_dvalgt0 == 1 && c_t1ltt2 == 1)
nstate <= s_write1;
else
nstate <= s_incr1;
end

s_incr1: begin
c_cmux_sel <=1;
c_c_ld <=1;
c_t2_ld<=0;
c_s_dmr<=0;
nstate<=s_incr2;
end

s_incr2: begin
c_c_ld<=0;
nstate<=s_c_check;
end

s_write1: begin
c_wd_sel<=1;
c_ra_sel<=1;
c_s_dmw<=1;
nstate<=s_write2;
end

s_write2: begin
c_ra_sel<=0;
c_wd_sel<=0;
c_s_dmw<=1;
nstate<=s_check1;
end

s_check1: begin
c_dmux_sel<=1;
c_s_dmw<=0;
c_d_ld<=1;
nstate<=s_check2;
end

s_check2: begin
c_d_ld<=0;
if(c_dvalgt0 == 1)
nstate<=s_read1;
else
nstate<=s_incr1;
end

endcase
end

always@(posedge c_clk) begin
	if (c_s_rst==1) begin
		state <= s_wait;
	end
	else begin
	   state <= nstate;
	end
end

endmodule
