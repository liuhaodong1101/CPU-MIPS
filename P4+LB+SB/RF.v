`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:51 10/28/2022 
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
    input reset,clk,
	 input jal_sel,RegWrite,RegDst,
	 input [4:0] A1,A2,A3,
	 input [31:0] instruction,Pc,PcAddr4,WD3,
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
   else if(RegWrite==1)
   begin
	    if(jal_sel==1)
		   begin
			//jal 
		     $display("@%h: $%d <= %h", Pc, T, PcAddr4);
           grf[T] <= PcAddr4;
		   end
       else if(A3!=0)
	    begin
		     $display("@%h: $%d <= %h", Pc, A3, WD3);
           grf[A3] <= WD3;
	    end
   end
end

assign RD1=grf[A1];
assign RD2=grf[A2];

endmodule

