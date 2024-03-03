`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:10 10/28/2022 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
  wire ALUSrc,MemWrite,MemtoReg,RegDst,RegWrite,Extop,jal_sel,lb_sel,sb_sel;
  wire [2:0]ALUControl,Npc_op;
  wire [31:0]Instruction;
  
  ControlModule CU(
  //in
  .Instruction(Instruction),
  //out
  .RegDst(RegDst),.RegWrite(RegWrite),.Extop(Extop),.ALUControl(ALUControl),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.jal_sel(jal_sel),.Npc_op(Npc_op),.lb_sel(lb_sel),.sb_sel(sb_sel)
  );
  
  DataPath MAIN(
  //in
  .clk(clk),.reset(reset),
  //in from Controler
  .RegDst(RegDst),.RegWrite(RegWrite),.Extop(Extop),.ALUControl(ALUControl),.MemtoReg(MemtoReg),.MemWrite(MemWrite),.ALUSrc(ALUSrc),.jal_sel(jal_sel),.Npc_op(Npc_op),.lb_sel(lb_sel),.sb_sel(sb_sel),
  //out
  .Instruction(Instruction)
  );
endmodule 