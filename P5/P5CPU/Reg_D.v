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
    input [31:0] Instr,
    input [31:0] Pc,
    input clk,
    output reg[31:0] InstrD,
    output reg[31:0] Pc_D
    );

always@(posedge clk)begin
  if(reset) begin
  InstrD<=32'h0;
  Pc_D<=32'h0;
  end
  else if(stall==0)begin
     InstrD<=Instr;
     Pc_D<=Pc;
  end
  else begin
     InstrD<=InstrD;
     Pc_D<=Pc_D;
  end
end


endmodule 