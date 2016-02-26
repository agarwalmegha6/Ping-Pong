`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:23 04/15/2015 
// Design Name: 
// Module Name:    isgreaterthan 
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
module dgtzero(a,b, c);
input [7:0] a,b;
output reg c;

always @(a or b ) begin
	if (a>b)
		c <=1;
	else
		c<=0;
end

endmodule
