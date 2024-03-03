`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:36 11/08/2022 
// Design Name: 
// Module Name:    Reg_M 
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
module Reg_M(
    input [1:0] T_new_E,
	 input jal_selE,
	 output reg jal_selM,
    input reset,
    input clk,
	 input [4:0] E_A2,
	 output reg[4:0] M_A2,
	 input [31:0] PcE,
    input RegWriteE,
    input MemtoRegE,
    input [31:0] ALUResult,
    input [31:0] WriteDataE,
    input [4:0] WriteRegE,
	 output reg [1:0] T_new_M,
    output reg RegWriteM,
    output reg MemtoRegM,
    output reg [31:0] ALUOutM,
    output reg [31:0] WriteDataM,
    output reg [4:0] WriteRegM,
	 output reg [31:0] PcM,
	 input [31:0] InstrE,
	 output reg[31:0] InstrM
    );
always@(posedge clk) begin
if(reset) begin
RegWriteM<=0;
MemtoRegM<=0;
ALUOutM<=0;
WriteDataM<=0;
WriteRegM<=0;
PcM<=0;
T_new_M<=2'b11;
M_A2<=0;
jal_selM<=0;
InstrM<=0;
end
else begin
RegWriteM<=RegWriteE;
MemtoRegM<=MemtoRegE;
ALUOutM<=ALUResult;
WriteDataM<=WriteDataE;
WriteRegM<=WriteRegE;
PcM<=PcE;
T_new_M<=(T_new_E>0)?(T_new_E-1):2'b0;
M_A2<=E_A2;
jal_selM<=jal_selE;
InstrM<=InstrE;
end
end

endmodule 