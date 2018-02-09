`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2017 10:56:35 PM
// Design Name: 
// Module Name: MEM
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


module MEM(signal,rst,clk,ewreg,em2reg,ewmem,rd_in,alur,qb_in,mwreg,mm2reg,rd_out,alur_out,Data_out,endsignal);
input signal;
input rst, clk;
input ewreg,em2reg,ewmem;
input [4:0] rd_in;
input [31:0]alur;
input[31:0] qb_in;
output reg mwreg;
output reg mm2reg;
output reg [4:0] rd_out;
output reg[31:0]alur_out;
output wire[31:0]Data_out;
output reg endsignal;
reg mwmem;
reg [31:0]address,data_in;
always @(posedge clk or posedge rst)
begin
if(rst) begin
mwreg<=1'bx;
mm2reg<=1'bx;
mwmem<=1'bx;
rd_out<=4'bxxxx;
alur_out<=32'hxxxxxxxx;
address<=32'hxxxxxxxx;
data_in<=32'hxxxxxxxx;
end
else begin
mwreg<=ewreg;
mm2reg<=em2reg;
mwmem<=ewmem;
rd_out<=rd_in;
alur_out<=alur;
address<=alur;
data_in<=qb_in;
endsignal<=signal;
end
end
DataMem zz(clk,mwmem,address,data_in,Data_out);
endmodule
