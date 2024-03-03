`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:18 11/08/2022 
// Design Name: 
// Module Name:    Reg_D 
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
module Reg_D(
    input reset,
	 input stall,
    input [31:0] InstrF,
    input [31:0] PcF,
    input clk,
	 input BD_F,
	 output reg BD_D,
	 input [4:0] F_ExcCode,
	 output reg [4:0] D_ExcCode,
    output reg[31:0] InstrD,
    output reg[31:0] PcD,
	 input Req
    );

always@(posedge clk)begin
  if(reset||Req) begin
  InstrD<=32'h0;
  PcD<=Req?32'h4180:32'h0;
  D_ExcCode<=0;
  BD_D<=0;
  end
  else if(stall==0)begin
     InstrD<=InstrF;
     PcD<=PcF;
	  D_ExcCode<=F_ExcCode;
	  BD_D<=BD_F;
  end
  else begin
     InstrD<=InstrD;
     PcD<=PcD;
	  D_ExcCode<=D_ExcCode;
	  BD_D<=BD_D;
  end
end


endmodule 