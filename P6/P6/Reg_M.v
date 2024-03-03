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
	 input jalselE,
	 output reg jalselM,
    input reset,
    input clk,
	 input [4:0] E_A2,
	 output reg[4:0] M_A2,
	 input [31:0] PcE,
    input RegWriteEnableE,
    input MemtoRegE,
    input MemWriteE,
    input [31:0] ALUResult,
    input [31:0] WriteDataE,
    input [4:0] A3E,
	 output reg [1:0] T_new_M,
    output reg RegWriteEnableM,
    output reg MemtoRegM,
    output reg MemWriteM,
    output reg [31:0] ALUOutM,
    output reg [31:0] WriteDataM,
    output reg [4:0] A3M,
	 output reg [31:0] PcM,
	 input [31:0] InstrE,
	 output reg[31:0] InstrM,
	 input [3:0] MDUOpE,
	 output reg[3:0] MDUOpM,
	 input [31:0] MDUOutE,
	 output reg[31:0] MDUOutM,
	 input CheckE,
	 output reg CheckM
    );
always@(posedge clk) begin
if(reset) begin
RegWriteEnableM<=0;
MemtoRegM<=0;
MemWriteM<=0;
ALUOutM<=0;
WriteDataM<=0;
A3M<=0;
PcM<=0;
T_new_M<=2'b11;
M_A2<=0;
jalselM<=0;
InstrM<=0;
MDUOpM<=0;
MDUOutM<=0;
CheckM<=0;
end
else begin
RegWriteEnableM<=RegWriteEnableE;
MemtoRegM<=MemtoRegE;
MemWriteM<=MemWriteE;
ALUOutM<=ALUResult;
WriteDataM<=WriteDataE;
A3M<=A3E;
PcM<=PcE;
T_new_M<=(T_new_E>0)?(T_new_E-1):2'b0;
M_A2<=E_A2;
jalselM<=jalselE;
InstrM<=InstrE;
MDUOpM<=MDUOpE;
MDUOutM<=MDUOutE;
CheckM<=CheckE;
end
end

endmodule 