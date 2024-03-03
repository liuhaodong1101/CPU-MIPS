`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:51:30 12/11/2022 
// Design Name: 
// Module Name:    E_exceptionfixed 
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
`define add 3'd2
`define sub 3'd3
`define AdEL 5'd4
`define AdES 5'd5
`define Syscall 5'd8
`define RI 5'd10
`define Ov 5'd12
module E_exceptionfixed(
  input[4:0] E_ExcCode,
  input [31:0] InstrE,
  input [2:0] ALUControlE,
  input [31:0] S1,S2,
  output [4:0] E_ExcCodeFixed
    );

assign Overflow = ((InstrE[31:26]===6'b0)&&(InstrE[5:0]===6'b100000||InstrE[5:0]===6'b100010))||(InstrE[31:26]===6'b001000);//add, sub,addi
assign DMLoadOverflow = (InstrE[31:26]===6'b100011||InstrE[31:26]===6'b100001||InstrE[31:26]===6'b100000);//LW||LH||LB
assign DMSaveOverflow = (InstrE[31:26]===6'b101011||InstrE[31:26]===6'b101000||InstrE[31:26]===6'b101001);//SW||SB||SH

wire [32:0] exS1 = {S1[31], S1}, exS2 = {S2[31], S2};
wire [32:0] exAdd = exS1 + exS2, exSub = exS1 - exS2;
assign excOv =  Overflow && (
                    ((ALUControlE === `add) && (exAdd[32] !== exAdd[31])) ||
                    ((ALUControlE === `sub) && (exSub[32] !== exSub[31]))
                );
assign excAdEL =  DMLoadOverflow&& (
                    ((ALUControlE === `add) && (exAdd[32] !== exAdd[31])) ||
                    ((ALUControlE === `sub) && (exSub[32] !== exSub[31]))
                );
assign excAdES =  DMSaveOverflow&& (
                    ((ALUControlE === `add) && (exAdd[32] !== exAdd[31])) ||
                    ((ALUControlE === `sub) && (exSub[32] !== exSub[31]))
                );					 
					 
assign 	E_ExcCodeFixed	=excOv?`Ov:
								 excAdEL?`AdEL:
								 excAdES?`AdES:
								 E_ExcCode;
endmodule 