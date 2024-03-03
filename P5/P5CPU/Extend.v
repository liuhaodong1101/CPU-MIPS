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
    input [15:0] imm16,
	 input Signed,
    output [31:0] imm32
    );

assign imm32=(Signed==1)?{{16{imm16[15]}},imm16}:{16'b0,imm16};
endmodule
