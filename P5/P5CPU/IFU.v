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
    output reg [31:0] Pc,
    output reg [31:0] Instr
    );
reg [31:0] memory[4095:0];

initial
  begin
$readmemh("code.txt",memory);
Pc<= 32'h00003000;
Instr<=32'h00000000;
  end
  
always@(posedge clk)
begin
  if(reset==1) begin Pc<= 32'h00003000;
  end
  else begin
  if(stall==0) Pc<=NPc;
  else Pc<=Pc;
  end
end
wire [31:0] tempPc;
assign tempPc=Pc-32'h00003000;

always@(tempPc)begin
Instr <= memory[tempPc[13:2]];
end

endmodule
