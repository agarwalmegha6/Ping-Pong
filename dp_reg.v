`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:54 05/04/2015 
// Design Name: 
// Module Name:    dp_reg 
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
module dp_reg(a,b,clk,clr,ld);

input[7:0] a;
input clr, ld, clk;
output reg [7:0] b;

always@(posedge clk) begin
	if (clr == 1)
		b <= 0;
	else if (ld == 1)
		b <= a;
end

endmodule
