`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:35 11/08/2022 
// Design Name: 
// Module Name:    IFU 
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
module IFU(
    input clk,
    input reset,
	 input stall,
    input [31:0] NPc,
    output reg [31:0] PcF
    ); 
always@(posedge clk)
begin
  if(reset==1) begin PcF<= 32'h00003000;
  end
  else begin
  if(stall==0) PcF<=NPc;
  else PcF<=PcF;
  end
end
endmodule
