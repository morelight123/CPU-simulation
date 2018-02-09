`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2017 10:34:10 PM
// Design Name: 
// Module Name: MUX_32bit
// Project Name: 
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


module MUX_32bit(c,a,b,r);
input c;
input [31:0] a,b;
output reg [31:0] r;


always@ (a or b or c) begin
if(c)
     r<=b;
else
     r<=a;
end
endmodule
