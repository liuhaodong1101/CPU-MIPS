`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:05 11/08/2022 
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
    input [31:0] Instr,
	 output reg RegWriteD,
	 output reg MemtoRegD,
	 output reg BranchD,
	 output reg ALUSrcD,
    output reg RegDstD,
    output reg Extop,
	 output reg [1:0] ALUControlD,
	 output reg [2:0] NpcopD,
	 output reg jal_sel,
	 output reg [1:0] T_use_rs,
	 output reg [1:0] T_use_rt,
	 output reg [1:0] T_new
    );
  
  
always@(Instr)begin
  //R-type
  if(Instr[31:26]==6'b000000)
    begin
      //ADDU
      if(Instr[5:0]==6'b100000)
        begin
		    jal_sel=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteD=1'b1;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b10;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
      end
      //SUBU
      else if(Instr[5:0]==6'b100010)
        begin
		    jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteD=1'b1;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b11;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
        end
		  //jr 
		 else if(Instr[5:0]==6'b001000)
        begin
		    jal_sel=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b0;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b00;
          MemtoRegD=1'b0;
			 NpcopD=3'd3;
			 T_use_rs=2'b0;
			 T_use_rt=2'b11;
			 T_new=2'b1;
        end
		 else 
        begin
		    jal_sel=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b0;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b00;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
        end
   end
	
	
	//I type
      //ORI
   else if(Instr[31:26]==6'b001101)
      begin
		    jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b1;
          Extop=1'b0;
          ALUSrcD=1'b1;
          ALUControlD=2'b00;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b10;
        end
      //LW||LH||LB
    else if(Instr[31:26]==6'b100011||Instr[31:26]==6'b100001||Instr[31:26]==6'b100000)
      begin
		    jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b1;
          Extop=1'b1;
          ALUSrcD=1'b1;
          ALUControlD=2'b10;
          MemtoRegD=1'b1;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b11;
        end
        //SW||SB||SH
      else if(Instr[31:26]==6'b101011||Instr[31:26]==6'b101000||Instr[31:26]==6'b101001)
        begin
		    jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b0;
          Extop=1'b1;
          ALUSrcD=1'b1;
          ALUControlD=2'b10;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b10;
			 T_new=2'b1;
        end
        //BEQ
      else if(Instr[31:26]==6'b000100)
        begin
		    jal_sel=1'b0;
          BranchD=1'b1;
          RegDstD=1'b0;
          RegWriteD=1'b0;
          Extop=1'b1;
          ALUSrcD=1'b0;
          ALUControlD=2'b11;
          MemtoRegD=1'b0;
			 NpcopD=3'd1;
			 T_use_rs=2'b0;
			 T_use_rt=2'b0;
			 T_new=2'b1;
        end
        //LUI
      else if(Instr[31:26]==6'b001111)
        begin
		    jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b1;
          Extop=1'b0;
          ALUSrcD=1'b1;
          ALUControlD=2'b01;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b10;
      end
		
		
    //J type
	 //jal
     else if(Instr[31:26]==6'b000011)
       begin
		    jal_sel=1'b1;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b1;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b00;
          MemtoRegD=1'b0;
			 NpcopD=3'd2;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
      end
	 else
	 begin
	       jal_sel=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteD=1'b0;
          Extop=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=2'b00;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
	 end
		
  end

endmodule 