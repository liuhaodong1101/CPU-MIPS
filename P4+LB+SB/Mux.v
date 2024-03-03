`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:14 10/28/2022 
// Design Name: 
// Module Name:    Mux 
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
module Mux(
    input MemtoReg,Extop,RegDst,ALUSrc,
	 input [31:0] ALUResult,Dm_out,instruction,RD2,
	 output [4:0] A3,
	 output [31:0] WD3,S2
    );
wire [31:0] imm32;
assign imm32=(Extop==1)?{{16{instruction[15]}},instruction[15:0]}:{16'b0,instruction[15:0]};
assign S2=(ALUSrc==1)?imm32:RD2;//sorce for aludata2

assign WD3=(MemtoReg==1)? Dm_out:ALUResult;//data for rf to write

assign A3=(RegDst==1)?instruction[15:11]:instruction[20:16];//address for rf to write in

endmodule
