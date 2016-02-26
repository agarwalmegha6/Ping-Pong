`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:41 04/09/2015 
// Design Name: 
// Module Name:    mux2 
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
module mux2(a,b,sel,c);
input[7:0] a,b;
input sel;
output reg [7:0] c;

always @(a or b or sel)
begin
	if (sel==0)
		c <= a;
	else if (sel == 1)
		c<= b;
end

endmodule
