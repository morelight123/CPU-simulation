`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2017 09:20:58 PM
// Design Name: 
// Module Name: ALU
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


module ALU(aluc,A, B, r);
input[3:0] aluc;
input [31:0] A,B; 
output reg [31:0] r; 
always @(aluc, A, B) begin
case (aluc)
4'hx:r<=32'hxxxxxxxx;
0: r <= A & B; 
1: r <= A | B; 
2: r <= A + B; 
6: r <= A - B; 
7: r <= A < B ? 1 : 0; 
12: r <= ~(A | B); //result is nor default: ALUOut <= 0;
15: r<=(A+B)*(~A+~B);
endcase 
end 
endmodule



