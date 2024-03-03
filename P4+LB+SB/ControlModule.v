`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:38 10/28/2022 
// Design Name: 
// Module Name:    ControlModule 
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
module ControlModule(
    input [31:0] Instruction,
    output reg RegDst,
    output reg RegWrite,
    output reg Extop,
	 output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg [2:0] ALUControl,
	 output reg [2:0] Npc_op,
	 output reg jal_sel,
	 output reg lb_sel,//load byte
	 output reg sb_sel //save byte
    );
	 
	 
  
  
  
always@(Instruction)begin
  RegDst=1'b0;
  RegWrite=1'b0;
  Extop=1'b0;
  ALUSrc=1'b0;
  MemWrite=1'b0;
  MemtoReg=1'b0;
  jal_sel=1'b0;
  ALUControl=3'd0;
  Npc_op=3'd0;
  lb_sel=1'b0;
  sb_sel=1'b0;
	 //R-type
  if(Instruction[31:26]==6'b000000)
    begin
      //ADD
      if(Instruction[5:0]==6'b100000)
        begin
          RegDst=1'b1;
          RegWrite=1'b1;
          Extop=1'b0;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd2;
			 Npc_op=3'b0;
      end
      //SUB
      else if(Instruction[5:0]==6'b100010)
        begin
          RegDst=1'b1;
          RegWrite=1'b1;
          Extop=1'b0;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd3;
			 Npc_op=3'b0;
        end
		  //jr 
		 else if(Instruction[5:0]==6'b001000)
        begin
          RegDst=1'b0;
          RegWrite=1'b0;
          Extop=1'b0;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;  
			 ALUControl=3'd0;
			 Npc_op=3'd3;
        end
		 else 
        begin
          RegDst=1'b0;
          RegWrite=1'b0;
          Extop=1'b0;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd0;
			 Npc_op=3'd0;
        end
   end
	
	
	//I type
      //ORI
   else if(Instruction[31:26]==6'b001101)
      begin
          RegDst=1'b0;
          RegWrite=1'b1;
          Extop=1'b0;
          ALUSrc=1'b1;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd0;
			 Npc_op=3'd0;
        end
      //LW
    else if(Instruction[31:26]==6'b100011)
      begin
          RegDst=1'b0;
          RegWrite=1'b1;
          Extop=1'b1;
          ALUSrc=1'b1;
          MemWrite=1'b0;
          MemtoReg=1'b1;
          jal_sel=1'b0;
			 ALUControl=3'd2;
			 Npc_op=3'd0;
        end
        //SW
      else if(Instruction[31:26]==6'b101011)
        begin
          RegDst=1'b0;
          RegWrite=1'b0;
          Extop=1'b1;
          ALUSrc=1'b1;
          MemWrite=1'b1;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd2;
			 Npc_op=3'd0;
        end
        //BEQ
      else if(Instruction[31:26]==6'b000100)
        begin
          RegDst=1'b0;
          RegWrite=1'b0;
          Extop=1'b1;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd3;
			 Npc_op=3'd1;
        end
        //LUI
      else if(Instruction[31:26]==6'b001111)
        begin
          RegDst=1'b0;
          RegWrite=1'b1;
          Extop=1'b0;
          ALUSrc=1'b1;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd1;
			 Npc_op=3'd0;
      end
		
    //J type
	 //jal
     else if(Instruction[31:26]==6'b000011)
       begin
          RegDst=1'b0;
          RegWrite=1'b1;
          Extop=1'b0;
          ALUSrc=1'b0;
          MemWrite=1'b0;
          MemtoReg=1'b0;
          jal_sel=1'b1;
			 ALUControl=3'd0;
			 Npc_op=3'd2;
      end
    //lb
	  else if(Instruction[31:26]==6'b100000)
	    begin
		    RegDst=1'b0;
          RegWrite=1'b1;
          Extop=1'b1;
          ALUSrc=1'b1;
          MemWrite=1'b0;
          MemtoReg=1'b1;
          jal_sel=1'b0;
			 ALUControl=3'd2;
			 Npc_op=3'd0;
			 lb_sel=1'b1;
		 end
	 //sb
	 else if(Instruction[31:26]==6'b101000)
	   begin
		    RegDst=1'b0;
          RegWrite=1'b0;
          Extop=1'b1;
          ALUSrc=1'b1;
          MemWrite=1'b1;
          MemtoReg=1'b0;
          jal_sel=1'b0;
			 ALUControl=3'd2;
			 Npc_op=3'd0;
			 sb_sel=1'b1;
		end
  end

endmodule 