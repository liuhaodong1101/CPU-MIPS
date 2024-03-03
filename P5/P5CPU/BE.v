`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:39 11/21/2022 
// Design Name: 
// Module Name:    BE 
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
`define SW 6'b101011
`define SH 6'b101001
`define SB 6'b101000


module BE(
    input [1:0] Addr10,
    input [5:0] StType,
    output [3:0] ByteEn
);
    assign ByteEn = StType == `SW ? (4'b1111) :
                    StType == `SH ? (
                        Addr10 == 2'b00 ? 4'b0011 :
                        Addr10 == 2'b10 ? 4'b1100 : 4'bx
                    ) : 
                    StType == `SB ? (
                        Addr10 == 2'b00 ? 4'b0001 :
                        Addr10 == 2'b01 ? 4'b0010 :
                        Addr10 == 2'b10 ? 4'b0100 :
                        Addr10 == 2'b11 ? 4'b1000 : 4'bx
                    ) : 4'bx;
endmodule
