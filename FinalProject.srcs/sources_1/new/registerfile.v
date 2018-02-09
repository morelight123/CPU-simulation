`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 02:42:19 PM
// Design Name: 
// Module Name: registerfile
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


module registerfile(Read1,Read2,WriteReg,WriteData,RegWrite, Data1, Data2, clk);
input [4:0] Read1, Read2, WriteReg;
input [31:0] WriteData;
input RegWrite, clk;
output [31:0] Data1, Data2;
reg [31:0] RF[31:0];
integer i;
 initial begin 
 RF[0]=32'hA00000AA;
 RF[1]=32'h10000011;
 RF[2]=32'h20000022;
 RF[3]=32'h30000033;
 RF[4]=32'h40000044;
 RF[5]=32'h50000055;
 RF[6]=32'h60000066;
 RF[7]=32'h70000077;
 RF[8]=32'h80000088;
 RF[9]=32'h90000099;
for(i=10;i<32;i=i+1)
RF[i]=0;
end
assign Data1=RF[Read1];
assign Data2=RF[Read2];

always @(posedge clk)
begin
if(RegWrite)
    RF[WriteReg]<=WriteData;
end
endmodule
