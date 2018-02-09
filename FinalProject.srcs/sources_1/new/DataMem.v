`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2017 11:07:35 PM
// Design Name: 
// Module Name: DataMem
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


module DataMem(clk,we,a,di,do);
input clk;
input we;
input [31:0] a;
input [31:0] di;
output [31:0] do;
reg [31:0] RAM[0:256];
integer i;
initial begin
for(i=0;i<256;i=i+1) begin
RAM[i]=0;end
RAM[0]=32'hA00000AA;
RAM[1]=32'h10000011;
RAM[2]=32'h20000022;
RAM[3]=32'h30000033;
RAM[4]=32'h40000044;
RAM[5]=32'h50000055;
RAM[6]=32'h60000066;
RAM[7]=32'h70000077;
RAM[8]=32'h80000088;
RAM[9]=32'h90000099;

end
assign do=RAM[a];
always @(posedge clk) begin
if(we)
RAM[a]<=di;
end

endmodule
