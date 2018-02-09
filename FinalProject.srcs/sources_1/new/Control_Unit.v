`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2017 02:33:56 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(op,func,wreg,m2reg,wmem,aluc,aluimm, regrt);
input [5:0] op, func;
output reg wreg, m2reg, wmem, aluimm, regrt;
output reg [3:0] aluc;
parameter [3:0] ADD=4'b0010, SUB=4'b0110,AND=4'b0000, OR=4'b0001,XOR=4'b1111;

always @(op, func)
begin 
    case(op)
    6'd0:begin
        wreg=1; regrt=0; m2reg=0; aluimm=0; wmem=0;
        case(func)
        6'b100000: begin aluc=ADD; end //add
        6'b100010:begin aluc=SUB;end //sub
        6'b100100:begin aluc=AND;end//and
        6'b100101:begin aluc=OR;end //or
        6'b100110:begin aluc=XOR;  end
        6'b101010:begin aluc=ADD; end//slt
        endcase
        end
    6'b001000:begin wreg=1;regrt=1;m2reg=0;aluimm=1;aluc=ADD; wmem=0; end    //addi
    6'b001100:begin wreg=1;regrt=1; m2reg=0;aluimm=0;aluc=AND; wmem=0; end    //andi
    6'b001101:begin wreg=1;regrt=1;m2reg=0;aluimm=1;aluc=OR; wmem=0; end    //ori
    6'b100011:begin wreg=1;regrt=1;m2reg=1;aluimm=1;aluc=ADD; wmem=0; end    //lw
    6'b101011:begin wreg=0;regrt=1'bx;;m2reg=1'bx;aluimm=1;;aluc=ADD; wmem=1; end    //sw
    6'bxxxxxx:begin wreg=1'bx;regrt=1'bx;;m2reg=1'bx;aluimm=1'bx;;aluc=4'bxxxx; wmem=1'bx; end
    endcase
end
endmodule
