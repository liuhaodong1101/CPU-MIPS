`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:45 11/08/2022 
// Design Name: 
// Module Name:    RF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
	 input jal_sel,
	 input [31:0] Pc,
    input clk,
    input WE,
	 input reset,
    output [31:0] RD1,
    output [31:0] RD2
    );
	 
reg [31:0] grf[31:0];
integer n;
initial begin
for(n=0;n<=31;n=n+1)
grf[n] <=32'b0;
end

parameter T=5'd31;
always@(posedge clk)
begin
  if(reset==1)
    begin
	  
      for(n=0;n<=31;n=n+1)
      grf[n] <=32'b0;
    end
   else if(WE==1)
   begin
	    if(jal_sel==1)
		   begin
			
		     $display("%d@%h: $%d <= %h",$time,Pc, T, Pc+8);
			 
           grf[T] <= Pc+8;
		   end
       else if(A3!=0)
	    begin
		     $display("%d@%h: $%d <= %h",$time,Pc, A3, WD);
			  
           grf[A3] <= WD;
	    end
   end
end
assign RD1=grf[A1];
assign RD2=grf[A2];

endmodule
