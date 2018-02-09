`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 10:50:50 PM
// Design Name: 
// Module Name: IF
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


module IF(rst,clk,instr);
input clk, rst;
output reg [31:0] instr;
reg [31:0] pc;
reg [31:0] temp;
reg[5:0] newop, oldop;
reg [4:0]rd,rt,rs, oldrt;
integer i=0;
parameter INCREMENT_AMOUNT = 32'd4;
reg [31:0] RAM[0:256];
parameter add=6'd0, addi=6'b001000, andi=6'b001100, ori=6'b001101, lw=6'b100011, sw=6'b101011;
initial begin
RAM[25]=32'h221820;
RAM[26]=32'h1232022;
RAM[27]=32'h692825;
RAM[28]=32'h693026;
RAM[29]=32'h693824;
RAM[30]=32'hFFFFFFFF;
end
always @(posedge clk or posedge rst) 
begin 
if (rst) 
pc <= 32'd100; 
else
if(i==0)
pc <= pc + INCREMENT_AMOUNT; 
end
always@(pc) begin
temp<=RAM[pc >>2]; 
end
always@(temp) begin
newop<=temp[31:26];
rt<=temp[20:16];
rs<=temp[25:21];
case(oldop)
    add: begin
        case(newop)
        add: begin
            if(rd==(rt|rs))
            i<=2;
        end
        andi,ori,sw,lw:begin
            if(rd==rs)
            i<=2;
        end
        endcase
        end
    andi,ori,sw,lw:begin
    case(newop)
            add: begin
                if(oldrt==(rt|rs))
                i<=2;
            end
            andi,ori,sw,lw:begin
                if(oldrt==rs)
                i<=2;
            end
    endcase
end
endcase
end
always@(posedge clk) begin
if (i!=0) begin
instr<=32'hxxxxxxxx;
i<=i-1;
end
else begin
instr<=temp; 
end
end
always@(instr) begin
rd<=temp[15:11];
oldop<=temp[31:26];
oldrt<=temp[20:16];
end
endmodule

