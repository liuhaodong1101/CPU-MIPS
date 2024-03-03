`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:16 11/20/2022 
// Design Name: 
// Module Name:    DMEXT 
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
`define LW 6'b100011
`define LH 6'b100001
`define LB 6'b100000

module DMEXT(
    input [1:0] Addr10,
    input [31:0] RData,
    input [5:0] LdType,
    output [31:0] Data
);
	 assign Data= LdType==`LW? RData:
                  LdType == `LH  ? (
                      Addr10 == 2'b00 ? {{16{RData[15]}} , RData[15: 0]} :
                      Addr10 == 2'b10 ? {{16{RData[31]}}, RData[31:16]} : 32'bx
                  ) :
						LdType == `LB ?(
						    Addr10 == 2'b00 ? {{24{RData[7]}}, RData[7: 0]} :
                      Addr10 == 2'b01 ? {{24{RData[15]}}, RData[15:8]} :
							 Addr10 == 2'b10 ? {{24{RData[23]}}, RData[23:16]} :
                      Addr10 == 2'b11 ? {{24{RData[31]}}, RData[31:24]} : 32'bx
						): 32'bx;
	 
endmodule 