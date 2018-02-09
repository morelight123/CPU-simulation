`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2017 12:57:23 AM
// Design Name: 
// Module Name: cpu
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


module cpu(rst,clk,endnote);
input clk, rst;
output wire endnote;
wire mwreg,mm2reg;
wire[4:0]MEMrd_out;
wire[31:0]MEMalur_out,dataout;
wire endsignal,endsignalEXE,MEMendsignal;

wire [31:0]qa,qb,imm_out,alu_r,EXEqb_out;
wire [31:0]instr;
wire wreg,m2reg,wmem,aluimm,ewreg,em2reg,ewmem;
wire [3:0]aluc;
wire[4:0]IDrd_out,EXErd_out;
IF aa(rst,clk,instr);
ID bb(rst,clk,instr,wreg,m2reg,wmem,aluc,aluimm,IDrd_out,qa,qb,imm_out,endsignal);
EXE cc(endsignal,rst,clk,wreg,m2reg,wmem,aluc,aluimm,IDrd_out,qa,qb,imm_out,ewreg,em2reg,ewmem,EXErd_out,alu_r,EXEqb_out,endsignalEXE);
MEM dd(endsignalEXE,rst, clk,ewreg,em2reg,ewmem,EXErd_out,alu_r,EXEqb_out,mwreg,mm2reg,MEMrd_out,MEMalur_out,dataout,MEMendsignal);
WB ee(MEMendsignal,rst,clk,mwreg,mm2reg,MEMrd_out,MEMalur_out,dataout,endnote);
endmodule
