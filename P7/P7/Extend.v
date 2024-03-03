`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:33:16 11/08/2022 
// Design Name: 
// Module Name:    Extend 
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
module Extend(
    input [15:0] imm16D,
	 input Signed,
    output [31:0] imm32D
    );

assign imm32D=(Signed==1)?{{16{imm16D[15]}},imm16D}:{16'b0,imm16D};
endmodule
