`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2017 03:52:56 PM
// Design Name: 
// Module Name: WB
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


module WB(signal,rst,clk,mwreg,mm2reg,rd_in,alu_in,memdata_in,endsignal);
input signal;
input rst,clk;
input mwreg,mm2reg;
input [4:0] rd_in;
input [31:0] alu_in,memdata_in;
output reg endsignal;
reg wwreg,wm2reg;
reg[4:0] rd_out;
reg[31:0] alu_out,memdata_out;
wire[31:0] mux_out;
wire[31:0] data1,data2;
always @(posedge clk or posedge rst)
begin
if(rst) begin
wwreg<=1'bx;
wm2reg<=1'bx;
rd_out<=5'bxxxxx;
alu_out<=32'hxxxxxxxx;
memdata_out<=32'hxxxxxxxx;
end
else begin
wwreg<=mwreg;
wm2reg<=mm2reg;
rd_out<=rd_in;
alu_out<=alu_in;
memdata_out<=memdata_in;
endsignal<=signal;
end
end
MUX_32bit eee(wm2reg,alu_out,memdata_out,mux_out);
registerfile fff(5'bxxxxx,5'bxxxxx,rd_out,mux_out,wwreg,data1,data2,clk);

endmodule
