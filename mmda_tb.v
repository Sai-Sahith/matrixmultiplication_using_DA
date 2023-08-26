`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 15:44:10
// Design Name: 
// Module Name: mmda_tb
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


module mmda_tb();
reg [7:0]a,b,c,d,e,f,g,h,j,c0,c1,c2;
wire[7:0]y0,y1,y2;
reg clk,reset;
mmda dut(a,b,c,d,e,f,g,h,j,c0,c1,c2,y0,y1,y2,clk,reset);
initial 
 clk=1'b0;

always 
 #10 clk=~clk;
 
initial
begin
a=8'd1;
b=8'd2;
c=8'd3;
d=8'd4;
e=8'd5;
f=8'd6;
g=8'd7;
h=8'd8;
j=8'd9;
c0=8'd1;
c1=8'd2;
c2=8'd3;
end
initial begin
reset = 1'b1;
#15 
reset = 1'b0;
#3 
reset = 1'b1;
#27
reset = 1'b0;

end
endmodule
