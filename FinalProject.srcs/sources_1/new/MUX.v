`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 02:45:04 PM
// Design Name: 
// Module Name: MUX
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


module MUX(regrt, rd, rt, out1);
input regrt;
input [4:0] rd, rt;
output reg [4:0] out1;


always@ (rd or rt or regrt) begin
if(regrt)
     out1<=rt;
else
     out1<=rd;
end
endmodule
