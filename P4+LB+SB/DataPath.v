`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:11 10/28/2022 
// Design Name: 
// Module Name:    DataPath 
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
module DataPath(
  input clk,reset,
  input Extop,jal_sel,ALUSrc,MemWrite,MemtoReg,RegDst,RegWrite,lb_sel,sb_sel,
  input [2:0]ALUControl,
  input [2:0] Npc_op,
  output [31:0]Instruction
);
  wire Zero;
  wire [4:0]A1,A2,A3;
  wire [31:0]instruction;
  wire [31:0]S1,S2,ALUResult,Dm_out,WD3;
  wire [31:0]Pc,PcAddr4,Npc;
  wire [31:0]RD1,RD2;
  
  assign S1=RD1;
  assign A1=instruction[25:21];
  assign A2=instruction[20:16];
  assign Instruction=instruction;
  
  IFU ifu(
          //in
          .Npc(Npc),.clk(clk),.reset(reset),
			 //out
			 .Pc(Pc),.instruction(instruction)
			 );
    
  RF rf(
        //in
        .A1(A1),.A2(A2),.A3(A3),.WD3(WD3),.clk(clk),.RegWrite(RegWrite),.reset(reset),.Pc(Pc),.jal_sel(jal_sel),.PcAddr4(PcAddr4),.instruction(instruction),.RegDst(RegDst),
		  //out
		  .RD1(RD1),.RD2(RD2)
		  );
		  
  Mux mux(
           //in
          .MemtoReg(MemtoReg),.Extop(Extop),.RegDst(RegDst),.ALUSrc(ALUSrc),.ALUResult(ALUResult),.Dm_out(Dm_out),.instruction(instruction),.RD2(RD2),
			 //out
			 .A3(A3),.WD3(WD3),.S2(S2)
			 );	  
  
  ALU alu(
          //in
          .S1(S1),.S2(S2),.ALUControl(ALUControl),
			 //out
			 .Zero(Zero),.ALUResult(ALUResult)
			 );
  
  DM dm(
         //in
         .Addr_DM(ALUResult),.Pc(Pc),.Dm_in(RD2),.clk(clk),.reset(reset),.MemWrite(MemWrite),.lb_sel(lb_sel),.sb_sel(sb_sel),
			//out
			.Dm_out(Dm_out)
		   );
 
  Npcmodule NpcM(
         //in
         .Pc(Pc),.instruction(instruction),.Radata(RD1),.Npc_op(Npc_op),.PcAddr4(PcAddr4),.Zero(Zero),
			//out
			.Npc(Npc)
			);
   

endmodule 