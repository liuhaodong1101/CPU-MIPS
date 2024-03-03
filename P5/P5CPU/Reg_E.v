`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:03 11/08/2022 
// Design Name: 
// Module Name:    Reg_E 
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
module Reg_E(
    input reset,
	 input stall,
	 input [1:0] T_new,
	 output reg[1:0] T_new_E,
    input [31:0] D_V1,
    input [31:0] D_V2,
	 input jal_selD,
	 output reg jal_selE,
    input [4:0] RtD,
    input [4:0] RdD,
	 input [4:0] RsD,
    input [31:0] imm32,
	 input [31:0] PcD,
    output reg[31:0] E_V1,
    output reg[31:0] E_V2,
    output reg[4:0] RtE,
    output reg[4:0] RdE,
	 output reg[4:0] RsE,
    output reg[31:0] imm32E,
	 output reg[31:0] PcE,
    input clk,
	 input [31:0] InstrD,
	 output reg [31:0] InstrE
    );
always@(posedge clk) begin
if(reset==1||stall==1) begin
E_V1<=0;
E_V2<=0;
RtE<=0;
RdE<=0;
imm32E<=0;
PcE<=0;
RsE<=0;
jal_selE<=0;
T_new_E<=0;
InstrE<=0;
end
else begin
E_V1<=D_V1;
E_V2<=D_V2;
RtE<=RtD;
RdE<=RdD;
imm32E<=imm32;
PcE<=PcD;
RsE<=RsD;
jal_selE<=jal_selD;
T_new_E<=(T_new>0)?T_new-1:0;
InstrE<=InstrD;
end
end

endmodule
