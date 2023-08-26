`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT GUWAHATI
// Engineer: Varada Sai Sahith
// 
// Create Date: 05.05.2023 14:57:08
// Design Name: 
// Module Name: mmda
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


module mmda(a,b,c,d,e,f,g,h,j,c0,c1,c2,y0,y1,y2,clk,reset);
input [7:0]a,b,c,d,e,f,g,h,j,c0,c1,c2;
output reg [7:0]y0,y1,y2;
input clk,reset;
wire [7:0]mem[0:7];
reg [15:0] out,out1,out2;
reg[2:0]muxin,muxin1,muxin2;
assign mem[0] = 8'b0;
assign mem[1] = c0;
assign mem[2] = c1;
assign mem[3] = c0+c1;
assign mem[4]=c2;
assign mem[5]=c0+c2;
assign mem[6]=c1+c2;
assign mem[7]=c0+c1+c2;
parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3;
reg [2:0]stage,nxtstage;
reg [3:0]i;
always @(posedge clk)
begin
if(reset)
stage <=s0;
else
stage<=nxtstage;
end


always @(*)
begin
case(stage)
s0:begin
    i<=4'd7;
    out<=16'b0;
    out1<=16'b0;
    out2<=16'b0;
    muxin<=3'b0;
    muxin1<=3'b0;
    muxin2<=3'b0;
    nxtstage <=s1;
   end
s1:begin
      muxin={c[i],b[i],a[i]};
      muxin1={f[i],e[i],d[i]};
      muxin2={j[i],h[i],g[i]};
      out= out<<1'b1;
      out1= out1<<1'b1;
      out2= out2<<1'b1;
          if(i==7)
          begin
           out =out- mem[muxin];
           out1 =out1- mem[muxin1];
           out2 =out2- mem[muxin2];
           nxtstage=s2;
           end
          else
          begin
           out =out+ mem[muxin]; 
           out1 =out1+ mem[muxin1];
           out2 =out2+ mem[muxin2];
           nxtstage=s2;
          end
   end
s2:begin
     if(i>0)
     begin
     i=i-1;
     nxtstage=s1;
     end
     else
     begin
     nxtstage=s3;
     end
   end
      
s3:begin
    y0<=out;
    y1<=out1;
    y2<=out2;
    nxtstage=s3;
   end  
endcase
end
endmodule
