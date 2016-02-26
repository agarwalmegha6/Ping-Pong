`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:20 04/09/2015 
// Design Name: 
// Module Name:    inc 
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
module inc(a,b);
input [7:0] a;
output reg [7:0] b;

always@(a) begin
	b<=a+1;
end

endmodule
