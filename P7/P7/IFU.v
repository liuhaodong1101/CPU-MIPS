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
    input Req,
    input clk,
    input reset,
	 input stall,
	 input D_eret,
	 input [31:0] EPC,
    input [31:0] NPc,
    output [31:0] PcF
    ); 
reg [31:0] tempPcF;
assign PcF=(D_eret===1'b1)?EPC:tempPcF;
always@(posedge clk)
begin
  if(reset||Req) begin 
		if(reset)tempPcF<= 32'h00003000;
      else tempPcF<= 32'h00004180;
  end
  else begin
  if(stall) tempPcF<=tempPcF;
  else begin
    tempPcF<=NPc;
  end
  end
end
endmodule
