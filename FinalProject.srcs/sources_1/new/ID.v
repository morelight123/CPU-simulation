`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 11:00:06 PM
// Design Name: 
// Module Name: ID
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


module ID(reset,clock,IDreg,wreg,m2reg,wmem,aluc,aluimm,rd_out,qa,qb,imm_out,endsignal);
input reset;
input clock;
input [31:0]IDreg;
output wire wreg,m2reg,wmem,aluimm;
output wire [4:0] rd_out;
output wire[3:0] aluc;
output wire [31:0] qa, qb,imm_out;
output reg endsignal;
reg [31:0]Instr;
wire [5:0]op,func;
wire [4:0]rd,rt,rs, WriteReg;
wire [15:0]imm;
wire regrt, RegWrite;
wire [31:0]WriteData;
always @(posedge clock)
begin
if(reset)
Instr<=32'hxxxxxxxx;
else
Instr<=IDreg;
if (Instr==32'hffffffff)
endsignal<=1;
end
assign RegWrite=1'b0;
assign WriteData=32'hxxxxxxxx;
assign WriteReg=5'bxxxxx;
assign op=Instr[31:26];
assign func=Instr[5:0];
assign rd=Instr[15:11];
assign rt=Instr[20:16];
assign rs=Instr[25:21];
assign imm=Instr[15:0];


Control_Unit aaa(op,func,wreg,m2reg,wmem,aluc,aluimm, regrt);
MUX bbb(regrt, rd, rt,rd_out);
registerfile ccc(rs,rt,WriteReg,WriteData,RegWrite,qa,qb,clock);
sign_extension ddd(imm,imm_out);

endmodule
