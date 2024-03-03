`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:30 10/28/2022 
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
    input [31:0] Npc,
    output reg [31:0] Pc,
    output reg [31:0] instruction
    );

reg [31:0] memory[4095:0];

initial
  begin
$readmemh("code.txt",memory);
Pc<= 32'h00003000;
instruction<=32'h00000000;
  end
  
always@(posedge clk)
begin
  if(reset==1) begin Pc<= 32'h00003000;
  //$display("has reset %h",Pc);
  end
  else begin
  //$display("has not reset %h %d",Pc,reset);
  Pc<=Npc;
  end
end
wire [31:0] tempPc;
assign tempPc=Pc-32'h00003000;
always@(*)begin
  instruction <= memory[tempPc[13:2]];
end
endmodule
