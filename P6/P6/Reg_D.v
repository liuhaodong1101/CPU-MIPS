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
    output reg[31:0] InstrD,
    output reg[31:0] PcD
    );

always@(posedge clk)begin
  if(reset) begin
  InstrD<=32'h0;
  PcD<=32'h0;
  end
  else if(stall==0)begin
     InstrD<=InstrF;
     PcD<=PcF;
  end
  else begin
     InstrD<=InstrD;
     PcD<=PcD;
  end
end


endmodule 