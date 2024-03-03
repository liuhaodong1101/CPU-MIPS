`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:16:38 10/28/2022 
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
    input Zero,
	 input [2:0] Npc_op,
    input [31:0] Pc,
    input [31:0] instruction,
    input [31:0] Radata,
    output [31:0] PcAddr4,
	 output reg [31:0] Npc
    );



wire [15:0] imm;
assign imm=instruction[15:0];
wire [31:0] imm2;
assign imm2={{16{imm[15]}},imm};
wire [31:0] imm3;
assign imm3=imm2<<2;
wire [31:0] Jal_pc;
assign Jal_pc={Pc[31:28],instruction[25:0],2'b00};
assign PcAddr4=Pc+4;
always@(*) begin
case(Npc_op)
3'd0: Npc=Pc+4;
3'd1: Npc=Pc+4+Zero*imm3;
3'd2: Npc=Jal_pc;
3'd3: Npc=Radata; 
endcase
end
endmodule
