`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:55 11/08/2022 
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
    input reset,
    input [31:0] i_inst_rdata,
    input [31:0] m_data_rdata,
    output [31:0] i_inst_addr,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,
    output [31:0] m_inst_addr,
    output w_grf_we,
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr
);
wire jalselD,jalselE,jalselM,jalselW;
wire RegWriteEnableD,RegWriteEnableE,RegWriteEnableM,RegWriteEnableW;
wire MemtoRegD,MemtoRegE,MemtoRegM,MemtoRegW;
wire MemWriteD,MemWriteE,MemWriteM;
wire RegDstD,RegDstE;
wire ALUSrcD,ALUSrcE;
wire BranchD;
wire ExtopD;
wire Zero;
wire [2:0] ALUControlD,ALUControlE;//
wire [1:0] T_use_rs,T_use_rt,T_new;
wire [1:0] T_new_E,T_new_M,T_new_W;
wire [2:0] NpcopD;
wire [4:0] A3E,A3M,A3W;
wire [4:0] RsD,RsE;
wire [4:0] RtD,RtE,RtM;//RtM is for dm to write in
wire [4:0] RdD,RdE;
wire [15:0] imm16D;
wire [31:0] imm32D,imm32E;//imm32 is in D
wire [31:0] NPc,PcF,PcD,PcE,PcM,PcW;
wire [31:0] InstrF,InstrD,InstrE,InstrM;//Instr is InstrF
wire [31:0] WriteDataE,WriteDataM;
wire [31:0] ReadDataM,ReadDataW;
wire [31:0] D_V1,D_V2,E_V1,E_V2;
wire [31:0] S1,S2;
wire [31:0] ALUResult,ALUOutM,ALUOutW;
wire [31:0] RD1,RD2;
wire [31:0] CMP1,CMP2;
wire [31:0] Dm_in;
wire [31:0] ResultW;
wire [3:0] MDUOpD,MDUOpE,MDUOpM,MDUOpW;
wire [31:0] MDUOutE,MDUOutM,MDUOutW;
wire CheckD,CheckE,CheckM,CheckW;

// control stall
wire stall;//stop control sign
wire Stall_rs_E = (A3E != 5'b0) && (RsD == A3E) && (T_new_E > T_use_rs);//E级为寄存器RsD写入，且RsD非0，且E级产生新数据用时大于rs将要使用的时间
wire Stall_rs_M = (A3M != 5'b0) && (RsD == A3M) && (T_new_M > T_use_rs);//M级为寄存器RsD写入，且RsD非0，且M级产生新数据用时大于rs将要使用的时间
wire Stall_rs = Stall_rs_E || Stall_rs_M;
wire Stall_rt_E = (A3E != 5'b0) && (RtD == A3E) && (T_new_E > T_use_rt);//E级为寄存器RtD写入，且RtD非0，且E级产生新数据用时大于rt将要使用的时间
wire Stall_rt_M = (A3M != 5'b0) && (RtD == A3M) && (T_new_M > T_use_rt);//M级为寄存器RtD写入，且RtD非0，且M级产生新数据用时大于rt将要使用的时间
wire Stall_rt = Stall_rt_E || Stall_rt_M;
wire Stall_mdu;
assign stall= Stall_rt||Stall_rs||Stall_mdu;
//



//F include IFU
  IFU 
ifu(
    //control in
    .clk(clk),.reset(reset),.stall(stall),
	 //data in
	 .NPc(NPc),
	 //data out
	 .PcF(PcF)
	 );
assign i_inst_addr=PcF;	 
assign InstrF=i_inst_rdata;
	 
//D include Controler, Grf, CMP, Extend, Npcmodule
assign RsD=InstrD[25:21],RtD=InstrD[20:16],RdD=InstrD[15:11],imm16D=InstrD[15:0];
//转发 D级
assign D_V1=(RsD==0)?0://0寄存器恒为零
            //E级转发
				//(RsD==A3E&&(MDUOpE==4'd5||MDUOpE==4'd6))?MDUOutE:
            (RsD==31&&jalselE==1)?PcE+8://E级为JAL且RsD为31号寄存器
				//M级转发
				(RsD==31&&jalselM==1)?PcM+8://M级为JAL且RsD为31号寄存器
				(RsD==A3M&&(MDUOpM==4'd5||MDUOpM==4'd6))?MDUOutM:
				(RsD==A3M&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM://M级为非jal写入寄存器且写入地址为RsD
				//W级转发
            (RsD==A3W&&RegWriteEnableW==1)?ResultW://W级为写入寄存器且写入地址为RsD
				//不转发
				RD1;
assign D_V2=(RtD==0)?0://0寄存器恒为零
            //E级转发
				//(RtD==A3E&&(MDUOpE==4'd5||MDUOpE==4'd6))?MDUOutE:
            (RtD==31&&jalselE==1)?PcE+8:
				//M级转发
				(RtD==31&&jalselM==1)?PcM+8:
				(RtD==A3M&&(MDUOpM==4'd5||MDUOpM==4'd6))?MDUOutM:
				(RtD==A3M&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM:
				//W级转发
            (RtD==A3W&&RegWriteEnableW==1)?ResultW:
				//不转发
				RD2;
assign CMP1=D_V1,CMP2=D_V2;

//D reg				
  Reg_D 
reg_D(
      //control in
      .clk(clk),.reset(reset),.stall(stall),
		//data in
		.InstrF(InstrF),.PcF(PcF),
		//data out
		.InstrD(InstrD),.PcD(PcD)
		);
//control		
  ControlModule 
con(
   //data in
   .InstrD(InstrD),
	//data out
	.RegWriteEnableD(RegWriteEnableD),
	.MemtoRegD(MemtoRegD),
	.MemWriteD(MemWriteD),
	.BranchD(BranchD),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.ExtopD(ExtopD),
	.ALUControlD(ALUControlD),
	.NpcopD(NpcopD),
	.jalselD(jalselD),
   .T_use_rs(T_use_rs),
	.T_use_rt(T_use_rt),
	.T_new(T_new),
	.MDUOpD(MDUOpD),
	.CheckD(CheckD)
	);
//npc		
  Npcmodule 
npcmodule(
          //control sign in
          .NPcop(NpcopD),.Zero(Zero),
			 //data in
			 .PcF(PcF),.PcD(PcD),.InstrD(InstrD),.Radata(D_V1),
			 //data out
			 .NPc(NPc)
			 );	 
//grf		
  RF 
rf(
   //control in
   .clk(clk),.reset(reset),.WE(RegWriteEnableW),
	//data in
   .A1(RsD),.A2(RtD),.A3(A3W),.WD(ResultW),.Pc(PcW),
	//data out
	.RD1(RD1),.RD2(RD2)
	);
//ext imm16D
  Extend 
extend(
      //control sign in
      .Signed(ExtopD),
	   //data in
      .imm16D(imm16D),
		//data out
		.imm32D(imm32D)
	);
//cmp for beq
  CMP 
cmp(
   //data in
   .CMP1(CMP1),.CMP2(CMP2),
	//data out
	.Zero(Zero)
	);
	
	
//E include ALU
//E reg
  Reg_E 
reg_E(
    //control  in
	 .clk(clk),
	 .reset(reset),
	 .stall(stall),
	 //control sign in
	 .jalselD(jalselD),
	 .T_new(T_new),
    //data in
    .D_V1(D_V1),
	 .D_V2(D_V2),
	 .RtD(RtD),
	 .RsD(RsD),
	 .RdD(RdD),
	 .PcD(PcD),
	 .imm32D(imm32D),
	 .InstrD(InstrD),
	 .MDUOpD(MDUOpD),
	 .CheckD(CheckD),
	 //data out
	 .E_V1(E_V1),
	 .E_V2(E_V2),
	 .RtE(RtE),
	 .RsE(RsE),
	 .RdE(RdE),
	 .PcE(PcE),
	 .imm32E(imm32E),
	 .InstrE(InstrE),
	 .MDUOpE(MDUOpE),
	 .CheckE(CheckE),
	 //control sign out
	 .jalselE(jalselE),
	 .T_new_E(T_new_E)
	 );

  Reg_E2 
reg_E2(
      //control in
		.clk(clk),
		.reset(reset),
		.stall(stall),
		//control sign in
      .RegWriteEnableD(RegWriteEnableD),
		.MemtoRegD(MemtoRegD),
		.MemWriteD(MemWriteD),
		.ALUsrcD(ALUSrcD),
		.RegDstD(RegDstD),
      .ALUcontrolD(ALUControlD),
		//control out
		.RegWriteEnableE(RegWriteEnableE),
		.MemtoRegE(MemtoRegE),
		.MemWriteE(MemWriteE),
		.ALUsrcE(ALUSrcE),
		.RegDstE(RegDstE),
		.ALUcontrolE(ALUControlE)
      );
//转发 E级

wire [31:0] Data2;
assign Data2= (RtE==0)?0://0寄存器恒为0
			     //M级转发
				  (RtE==31&&jalselM==1)?PcM+8://M级为jal且RsE为31号寄存器
				  (RtE==A3M&&(MDUOpM==4'd5||MDUOpM==4'd6))?MDUOutM:
              (RtE==A3M&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM://M级为非jal写入寄存器且写入地址为RtE
			     //W级转发
              (RtE==A3W&&RegWriteEnableW==1)?ResultW://W级为写寄存器且写入为RtE
				  //不转发
				  E_V2;



assign S1=(RsE==0)?0://0寄存器恒为0
          //M级转发
			 (RsE==31&&jalselM==1)?PcM+8://M级为jal且RsE为31号寄存器
			 (RsE==A3M&&(MDUOpM==4'd5||MDUOpM==4'd6))?MDUOutM:
          (RsE==A3M&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM://M级为非jal写入寄存器且写入地址为RsE
			 //W级转发
          (RsE==A3W&&RegWriteEnableW==1)?ResultW://W级为写寄存器且写入为RsE
			 //不转发
			  E_V1;
assign S2=(ALUSrcE==1)?imm32E:
          (RtE==0)?0://0寄存器恒为0
			 //M级转发
			 (RtE==31&&jalselM==1)?PcM+8://M级为jal且RsE为31号寄存器
			 (RtE==A3M&&(MDUOpM==4'd5||MDUOpM==4'd6))?MDUOutM:
          (RtE==A3M&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM://M级为非jal写入寄存器且写入地址为RtE
			 //W级转发
          (RtE==A3W&&RegWriteEnableW==1)?ResultW://W级为写寄存器且写入为RtE
			 //不转发
			 E_V2;
			 		 
//MDU
  MDU
mdu(
    .clk(clk),
    .reset(reset),
	 .MDUOpD(MDUOpD),
    .MDUOp(MDUOpE),
    .Data1(S1),
    .Data2(Data2),
    .out(MDUOutE),
    .stall_mdu(Stall_mdu)	 
  );			 
			 
			 
//ALU
  ALU 
alu(
   //control in
	.ALUControl(ALUControlE),
   //data in
   .S1(S1),
	.S2(S2),
	//data out
	.ALUResult(ALUResult)
	);
//Data for dm	
assign WriteDataE=(A3M==RtE&&RegWriteEnableM==1&&MemtoRegM==0&&jalselM==0)?ALUOutM:
                  (A3W==RtE&&RegWriteEnableW==1)?									ResultW:
																										E_V2;
//Addr of grf to write in						
assign A3E= (jalselE==1'b1)?			5'd31:
                  (RegDstE==0)?      RtE:
                                     RdE;	


//M include DM
  Reg_M 
reg_M(
   //control in
	.clk(clk),
	.reset(reset),
	//control sign in
   .RegWriteEnableE(RegWriteEnableE),
	.MemtoRegE(MemtoRegE),
	.ALUResult(ALUResult),
	.WriteDataE(WriteDataE),
	.MemWriteE(MemWriteE),
	.A3E(A3E),
	.T_new_E(T_new_E),
	.jalselE(jalselE),
	//data in
	.PcE(PcE),
	.E_A2(RtE),
	.InstrE(InstrE),
	.MDUOpE(MDUOpE),
	.MDUOutE(MDUOutE),
	.CheckE(CheckE),
	//control sign out
	.RegWriteEnableM(RegWriteEnableM),
	.MemtoRegM(MemtoRegM),
	.ALUOutM(ALUOutM),
	.WriteDataM(WriteDataM),	
	.MemWriteM(MemWriteM),
	.A3M(A3M),
	.T_new_M(T_new_M),
	.jalselM(jalselM),
	//data out
	.PcM(PcM),
	.M_A2(RtM),
	.InstrM(InstrM),
	.MDUOpM(MDUOpM),
	.MDUOutM(MDUOutM),
	.CheckM(CheckM)
    );
//转发 M级
assign Dm_in= (RtM==0)?0://0寄存器恒为零
              //W级转发
              (RtM==A3W&&RegWriteEnableW==1)?ResultW://W级为写入寄存器且写入RtM
				  //不转发
              WriteDataM;
				  
assign m_data_addr=ALUOutM;
assign m_data_wdata=(InstrM[31:26]==6'b101011)?Dm_in:
                    (InstrM[31:26]==6'b101001)?{2{Dm_in[15:0]}}:
						                             {4{Dm_in[7:0]}};
assign m_inst_addr=PcM;
BE 
   be(
     .Addr10(ALUOutM[1:0]),
	  .StType(InstrM[31:26]),
	  .ByteEn(m_data_byteen)
     );
DMEXT 
  dmext(
    .Addr10(ALUOutM[1:0]),
	 .LdType(InstrM[31:26]),
	 .RData(m_data_rdata),
	 .Data(ReadDataM)
  );

  
//W include nothing
Reg_W 
  reg_W(
       //control in
       .clk(clk),.reset(reset),
		 //control sign in
		 .RegWriteEnableM(RegWriteEnableM),
		 .MemtoRegM(MemtoRegM),
		 .ALUOutM(ALUOutM),
		 .ReadDataM(ReadDataM),
		 .A3M(A3M),
		 .T_new_M(T_new_M),
		 .jalselM(jalselM),
		 //data in
		 .PcM(PcM),
		 .MDUOpM(MDUOpM),
		 .MDUOutM(MDUOutM),
		 .CheckM(CheckM),
		 //control sign out
		 .RegWriteEnableW(RegWriteEnableW),
		 .MemtoRegW(MemtoRegW),
       .ALUOutW(ALUOutW),
		 .ReadDataW(ReadDataW),
		 .A3W(A3W),
		 .T_new_W(T_new_W),
		 .jalselW(jalselW),
		 //data out
		 .PcW(PcW),
		 .MDUOpW(MDUOpW),
		 .MDUOutW(MDUOutW),
		 .CheckW(CheckW)
       );
		 
assign ResultW=              (jalselW==1)?PcW+8:  
                             (MDUOpW==4'd5||MDUOpW==4'd6)?MDUOutW:
                             (MemtoRegW==1)?				  ReadDataW:
					                                           ALUOutW;
assign w_grf_we=RegWriteEnableW;
assign w_grf_addr=A3W;
assign w_grf_wdata=ResultW;
assign w_inst_addr=PcW;

endmodule 