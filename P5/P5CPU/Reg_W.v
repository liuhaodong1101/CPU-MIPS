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
	 input jal_selM,
	 output reg[31:0] PcW,
	 output reg jal_selW,
    input clk,
	 input reset,
    input RegWriteM,
    input MemtoRegM,
    input [31:0] ALUOutM,
    input [31:0] ReadDataM,
    input [4:0] WriteRegM,
	 output reg [1:0] T_new_W,
    output reg RegWriteW,
    output reg MemtoRegW,
    output reg [31:0] ALUOutW,
    output reg [31:0] ReadDataW,
    output reg [4:0] WriteRegW,
	 input [31:0] InstrM,
	 output reg[31:0] InstrW
    );
always@(posedge clk) begin
if(reset) begin
RegWriteW<=0;
MemtoRegW<=0;
ALUOutW<=0;
ReadDataW<=0;
WriteRegW<=0;
T_new_W<=2'b11;
jal_selW<=0;
PcW<=0;
InstrW<=0;
end
else begin
RegWriteW<=RegWriteM;
MemtoRegW<=MemtoRegM;
ALUOutW<=ALUOutM;
ReadDataW<=ReadDataM;
WriteRegW<=WriteRegM;
T_new_W<=(T_new_M>0)?(T_new_M-1):2'b0;
jal_selW<=jal_selM;
PcW<=PcM;
InstrW<=InstrM;
end
end

endmodule
