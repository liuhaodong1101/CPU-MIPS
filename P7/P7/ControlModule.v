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
    input [31:0] InstrD,
	 output reg RegWriteEnableD,
	 output reg MemtoRegD,
	 output reg MemWriteD,
	 output reg BranchD,
	 output reg ALUSrcD,
    output reg RegDstD,
    output reg ExtopD,
	 output reg [2:0] ALUControlD,
	 output reg [2:0] NpcopD,
	 output reg jalselD,
	 output reg [1:0] T_use_rs,
	 output reg [1:0] T_use_rt,
	 output reg [1:0] T_new,
	 output reg [3:0] MDUOpD,
	 output reg CheckD,
	 output reg IsTrueInsD
    );
  
  
always@(InstrD)begin
  //R-type
  MDUOpD=4'd0;
  CheckD=1'b0;
  IsTrueInsD=1'b0;
  if(InstrD[31:26]===6'b000000)
    begin
      //ADD
      if(InstrD[5:0]===6'b100000)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd2;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
      end
      //SUB
      else if(InstrD[5:0]===6'b100010)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd3;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
        end
		 //syscall
      else if(InstrD[5:0]===6'b001100)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
        end
		 //MULT
		 else if(InstrD[5:0]===6'b011000)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b0;
			 MDUOpD=4'd1;
			 IsTrueInsD=1'b1;
        end
		  //MULTU
		  else if(InstrD[5:0]===6'b011001)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b0;
			 MDUOpD=4'd2;
			 IsTrueInsD=1'b1;
        end
		 //DIV
		  else if(InstrD[5:0]===6'b011010)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b0;
			 MDUOpD=4'd3;
			 IsTrueInsD=1'b1;
        end
		  //DIVU
		  else if(InstrD[5:0]===6'b011011)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b0;
			 MDUOpD=4'd4;
			 IsTrueInsD=1'b1;
        end
		  //MFHI
		   else if(InstrD[5:0]===6'b010000)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 MDUOpD=4'd5;
			 IsTrueInsD=1'b1;
        end
		 //MFLO
		   else if(InstrD[5:0]===6'b010010)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 MDUOpD=4'd6;
			 IsTrueInsD=1'b1;
        end
		  //MTHI
		   else if(InstrD[5:0]===6'b010001)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b0;
			 MDUOpD=4'd7;
			 IsTrueInsD=1'b1;
        end
		  //MTLO
		   else if(InstrD[5:0]===6'b010011)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b0;
			 MDUOpD=4'd8;
			 IsTrueInsD=1'b1;
        end
		  //jr 
		 else if(InstrD[5:0]===6'b001000)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd3;
			 T_use_rs=2'b0;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
        end
		 //AND
       else if(InstrD[5:0]===6'b100100)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd4;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
      end		 
		//OR
		else if(InstrD[5:0]===6'b100101)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd0;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
      end	
		//SLT
		  else if(InstrD[5:0]===6'b101010)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd5;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
        end
		 //SLTU
		   else if(InstrD[5:0]===6'b101011)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b1;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd6;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'b0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b1;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
        end
		 //nop
		 else if(InstrD===32'b0)
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
			end
			//RI
	  else
        begin
		    jalselD=1'b0;
		    BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b0;
			end
   end
	
	
	//I type
      //ORI
   else if(InstrD[31:26]===6'b001101)
      begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b1;
          ALUControlD=3'd0;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
        end
	  //ADDI
	else if(InstrD[31:26]===6'b001000)
      begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b1;
          ALUSrcD=1'b1;
          ALUControlD=3'd2;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
        end
	//ANDI
	 else if(InstrD[31:26]===6'b001100)
      begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b1;
          ALUControlD=3'd4;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
    end			 
      //LW||LH||LB
    else if(InstrD[31:26]===6'b100011||InstrD[31:26]===6'b100001||InstrD[31:26]===6'b100000)
      begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b1;
          ALUSrcD=1'b1;
          ALUControlD=3'd2;
          MemWriteD=1'b0;
          MemtoRegD=1'b1;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b11;
			 T_new=2'b11;
			 IsTrueInsD=1'b1;
        end
        //SW||SB||SH
      else if(InstrD[31:26]===6'b101011||InstrD[31:26]===6'b101000||InstrD[31:26]===6'b101001)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b1;
          ALUSrcD=1'b1;
          ALUControlD=3'd2;
          MemWriteD=1'b1;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b1;
			 T_use_rt=2'b10;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
        end
        //BEQ
      else if(InstrD[31:26]===6'b000100)
        begin
		    jalselD=1'b0;
          BranchD=1'b1;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b1;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd1;
			 T_use_rs=2'b0;
			 T_use_rt=2'b0;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
        end
		  //BNE
		else if(InstrD[31:26]===6'b000101)
        begin
		    jalselD=1'b0;
          BranchD=1'b1;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b1;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd4;
			 T_use_rs=2'b0;
			 T_use_rt=2'b0;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
        end
        //LUI
      else if(InstrD[31:26]===6'b001111)
        begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b1;
          ALUControlD=3'd1;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b10;
			 IsTrueInsD=1'b1;
      end
		
		
    //J type
	 //jal
     else if(InstrD[31:26]===6'b000011)
       begin
		    jalselD=1'b1;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd2;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
      end
		//eret
     else if(InstrD[31:26]===6'b010000&&InstrD[5:0]===6'b011000)
       begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b1;
      end
		//MTC0
     else if(InstrD[31:26]===6'b010000&&InstrD[25:21]===5'b00100)
       begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b10;
			 T_new=2'b0;//T_new =0;
			 IsTrueInsD=1'b1;
      end
		//MFC0
     else if(InstrD[31:26]===6'b010000&&InstrD[25:21]===5'b00000)
       begin
		    jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b1;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b1;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b11;
			 IsTrueInsD=1'b1;
      end
	 else
	 //RI
	 begin
	       jalselD=1'b0;
          BranchD=1'b0;
          RegDstD=1'b0;
          RegWriteEnableD=1'b0;
          ExtopD=1'b0;
          ALUSrcD=1'b0;
          ALUControlD=3'd7;
          MemWriteD=1'b0;
          MemtoRegD=1'b0;
			 NpcopD=3'd0;
			 T_use_rs=2'b11;
			 T_use_rt=2'b11;
			 T_new=2'b1;
			 IsTrueInsD=1'b0;
	 end
		
  end

endmodule 