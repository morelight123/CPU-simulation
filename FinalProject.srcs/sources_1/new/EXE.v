`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2017 08:51:37 PM
// Design Name: 
// Module Name: EXE
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


module EXE(signal,rst,clk,wreg,m2reg,wmem,aluc,aluimm,rd_in,qa_in,qb_in,imm_in,ewreg,em2reg,ewmem,rd_out,alu_r,qb_out, endsignal);
input signal;
input rst;
input clk;
input wreg,m2reg,wmem,aluimm;
input[3:0] aluc;
input[31:0] qa_in,qb_in,imm_in;
input [4:0] rd_in;
output reg ewreg,em2reg,ewmem;
output reg [4:0] rd_out;
output reg[31:0] qb_out;
output wire[31:0]alu_r;
output reg endsignal;
reg [3:0] ealuc;
reg [31:0] qa_wire, qb_wire,imm_wire;
reg ealuimm;
wire [31:0]mux_r;
always @(posedge clk or posedge rst)
begin
if(rst) begin
ewreg<=1'bx;
em2reg<=1'bx;
ewmem<=1'bx;
ealuimm<=1'bx;
ealuc<=4'bxxxx;
rd_out<=4'bxxxx;
qa_wire<=32'hxxxxxxxx;
qb_wire<=32'hxxxxxxxx;
imm_wire<=32'hxxxxxxxx;
qb_out<=32'hxxxxxxxx;
end
else begin
ewreg<=wreg;
em2reg<=m2reg;
ewmem<=wmem;
ealuimm<=aluimm;
ealuc<=aluc;
rd_out<=rd_in;
qa_wire<=qa_in;
qb_wire<=qb_in;
imm_wire<=imm_in;
qb_out<=qb_in;
endsignal<=signal;
end
end
MUX_32bit xx(ealuimm,qb_wire, imm_wire, mux_r);
ALU yy(ealuc,qa_wire,mux_r,alu_r);
endmodule
