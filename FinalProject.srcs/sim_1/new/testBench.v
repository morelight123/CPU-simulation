`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 11:43:32 PM
// Design Name: 
// Module Name: testBench
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


module testBench(
);
reg clk, rst;
wire endnote;
cpu a(rst,clk,endnote);
initial begin
#0 rst=1;
#5 rst=0;
#21 rst=0;
#40 rst=0;
end
initial begin
    clk=1'b1;
    forever #5 clk=~clk;
    end
    initial begin
    #150 $finish;
    end

endmodule
