`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:32 11/08/2022 
// Design Name: 
// Module Name:    Npcmodule 
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
module Npcmodule(
    input [31:0] Pc,
	 input [31:0] Pc_D,
    input [31:0] InstrD,
    input [31:0] Radata,
    input [2:0] NPcop,
	 input Zero,
    output reg [31:0] NPc
    );
wire [31:0] imm2;
assign imm2={{16{InstrD[15]}},InstrD[15:0]};
wire [31:0] imm3;
assign imm3=imm2<<2;
wire [31:0] Jal_pc;
assign Jal_pc={Pc[31:28],InstrD[25:0],2'b00};
always@(*) begin
case(NPcop)
3'd0: NPc=Pc+4;
3'd1: begin 
if(Zero==1) NPc=Pc_D+4+imm3;
else NPc=Pc+4;
end
3'd2: NPc=Jal_pc;
3'd3: NPc=Radata; 
endcase
end
endmodule
