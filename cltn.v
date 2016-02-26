`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:44 04/15/2015 
// Design Name: 
// Module Name:    islessthaneq 
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
module cltn(a,b,c);
input [7:0] a,b;
output reg c;

always @(a or b ) begin
	if (a<b) // Check for n or (n-1)
		c <=1;
	else
		c<=0;
end

endmodule
