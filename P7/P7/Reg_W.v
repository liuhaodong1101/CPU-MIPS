`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:28 11/08/2022 
// Design Name: 
// Module Name:    Reg_W 
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
module Reg_W(
    input [1:0] T_new_M,
	 input [31:0] PcM,
	 input jalselM,
	 output reg[31:0] PcW,
	 output reg jalselW,
	 input [31:0] CP0Out,
	 output reg [31:0] CP0OutW,
    input clk,
	 input reset,
    input RegWriteEnableM,
    input MemtoRegM,
    input [31:0] ALUOutM,
    input [31:0] ReadDataM,
    input [4:0] A3M,
	 output reg [1:0] T_new_W,
    output reg RegWriteEnableW,
    output reg MemtoRegW,
    output reg [31:0] ALUOutW,
    output reg [31:0] ReadDataW,
    output reg [4:0] A3W,
	 input [3:0] MDUOpM,
	 output reg[3:0] MDUOpW,
	 input [31:0] MDUOutM,
	 output reg[31:0] MDUOutW,
	 input CheckM,
	 output reg CheckW,
	 input [31:0] InstrM,
	 output reg [31:0] InstrW,
	 input Req
    );
always@(posedge clk) begin
if(reset||Req) begin
RegWriteEnableW<=0;
MemtoRegW<=0;
ALUOutW<=0;
ReadDataW<=0;
A3W<=0;
T_new_W<=2'b11;
jalselW<=0;
PcW<=0;
MDUOpW<=0;
MDUOutW<=0;
CheckW<=0;
CP0OutW<=0;
InstrW<=0;
end
else begin
RegWriteEnableW<=RegWriteEnableM;
MemtoRegW<=MemtoRegM;
ALUOutW<=ALUOutM;
ReadDataW<=ReadDataM;
A3W<=A3M;
T_new_W<=(T_new_M>0)?(T_new_M-1):2'b0;
jalselW<=jalselM;
PcW<=PcM;
MDUOpW<=MDUOpM;
MDUOutW<=MDUOutM;
CheckW<=CheckM;
CP0OutW<=CP0Out;
InstrW<=InstrM;
end
end

endmodule
