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
  input clk ,
  input reset
    );
//已经实现LBLHLW SBSHSW指令，LBLH指令，SBSH指令呈现方式为P6
//jal_sel    jal_sel is  jal_selD
wire jal_sel,jal_selE,jal_selM,jal_selW;
//RewWrite   enable for grf to write in
wire RegWriteD,RegWriteE,RegWriteM,RegWriteW;
//MemtoReg   is dm write to grf?
wire MemtoRegD,MemtoRegE,MemtoRegM,MemtoRegW;
//RegDst     select sign for WriteReg
wire RegDstD,RegDstE;
//ALUSrc     select sign to chose S2
wire ALUSrcD,ALUSrcE;
//Branch     for beq , work in D
wire BranchD;
//Extop      for imm32 , work in D
wire Extop;
//Zero       for beq , work in D
wire Zero;
//ALUControl 
wire [1:0] ALUControlD,ALUControlE;//
//T_use_rs,T_use_rt,T_new   for instr in D, T_new equal to T_new_D
wire [1:0] T_use_rs,T_use_rt,T_new;
//T_new      time for instr to get new data
wire [1:0] T_new_E,T_new_M,T_new_W;
//Npcop      for NPc , work in D
wire [2:0] NpcopD;
//WriteReg   address for grf to write in
wire [4:0] WriteRegE,WriteRegM,WriteRegW;
//Rs 25:21
wire [4:0] RsD,RsE;
//Rt 20:16
wire [4:0] RtD,RtE,RtM;//RtM is for dm to write in
//Rd 15:11
wire [4:0] RdD,RdE;
//imm16 in D
wire [15:0] imm16;
//imm32 
wire [31:0] imm32,imm32E;//imm32 is in D
//Pc
wire [31:0] NPc,Pc,Pc_D,PcE,PcM,PcW;
//Instr
wire [31:0] Instr,InstrD,InstrE,InstrM,InstrW;//Instr is InstrF
//WriteData  data to write in dm 
wire [31:0] WriteDataE,WriteDataM;
//ReadData   data read from dm
wire [31:0] ReadDataM,ReadDataW;
//V1,V2      D_v1:true digit for RsD-RD1
wire [31:0] D_V1,D_V2,E_V1,E_V2;
//S1,S2      two sorce of alu for cal
wire [31:0] S1,S2;
//ALUResult
wire [31:0] ALUResult,ALUOutM,ALUOutW;
//RD1,RD2     data in RD1 may not be new data, D_V1 is true data
wire [31:0] RD1,RD2;
//CMP1,CMP2   for beq , work in D
wire [31:0] CMP1,CMP2;
//Dm_in       true data to write in dm
wire [31:0] Dm_in;
//ResultW     data to wirite in grf
wire [31:0] ResultW;
//
wire [31:0] m_data_addr;//即将写入的Dm的地址32位，即字节地址，实际写入时左移两位
wire [31:0] m_data_wdata;//即将写入Dm的32位数， SB,SH指令时进行对Dm_in复制扩展
wire [31:0] Dm_out;//从Dm读出的对应地址的32位值， LB,LH指令时通过DMEXT模块加工后得到真正即将写入的ReadDataM
wire [3:0]  m_data_byteen;//写Dm字节是使能，  可以代替MemWrite

// control stall
wire stall;//stop control sign
wire Stall_rs_E = (WriteRegE != 5'b0 && RsD == WriteRegE) && (T_new_E > T_use_rs);//E级为寄存器RsD写入，且RsD非0，且E级产生新数据用时大于rs将要使用的时间
wire Stall_rs_M = (WriteRegM != 5'b0 && RsD == WriteRegM) && (T_new_M > T_use_rs);//M级为寄存器RsD写入，且RsD非0，且M级产生新数据用时大于rs将要使用的时间
wire Stall_rs = Stall_rs_E || Stall_rs_M;
wire Stall_rt_E = (WriteRegE != 5'b0 && RtD == WriteRegE) && (T_new_E > T_use_rt);//E级为寄存器RtD写入，且RtD非0，且E级产生新数据用时大于rt将要使用的时间
wire Stall_rt_M = (WriteRegM != 5'b0 && RtD == WriteRegM) && (T_new_M > T_use_rt);//M级为寄存器RtD写入，且RtD非0，且M级产生新数据用时大于rt将要使用的时间
wire Stall_rt = Stall_rt_E || Stall_rt_M;
assign stall= Stall_rt||Stall_rs;
//



//F include IFU
  IFU 
ifu(
    //control in
    .clk(clk),.reset(reset),.stall(stall),
	 //data in
	 .NPc(NPc),
	 //data out
	 .Instr(Instr),.Pc(Pc)
	 );
	 
	 
//D include Controler, Grf, CMP, Extend, Npcmodule
assign RsD=InstrD[25:21],RtD=InstrD[20:16],RdD=InstrD[15:11],imm16=InstrD[15:0];
//转发 D级  采用外部转发
assign D_V1=(RsD==0)?0://0寄存器恒为零
            //E级转发
            (RsD==31&&jal_selE==1)?PcE+8://E级为JAL且RsD为31号寄存器
				//M级转发
				(RsD==31&&jal_selM==1)?PcM+8://M级为JAL且RsD为31号寄存器
				(WriteRegM==RsD&&RegWriteM==1&&MemtoRegM==0)?ALUOutM://M级为写入寄存器且写入地址为RsD
				//W级转发
            (WriteRegW==RsD&&RegWriteW==1)?ResultW://W级为写入寄存器且写入地址为RsD
				(RsD==31&&jal_selW==1)?PcW+8://W级为JAL且RsD为31号寄存器
				//不转发
				RD1;
assign D_V2=(RtD==0)?0://0寄存器恒为零
            //E级转发
            (RtD==31&&jal_selE==1)?PcE+8:
				//M级转发
				(RtD==31&&jal_selM==1)?PcM+8:
				(WriteRegM==RtD&&RegWriteM==1&&MemtoRegM==0)?ALUOutM:
				//W级转发
            (WriteRegW==RtD&&RegWriteW==1)?ResultW:
				(RtD==31&&jal_selW==1)?PcW+8:
				//不转发
				RD2;
assign CMP1=D_V1,CMP2=D_V2;

//D reg				
  Reg_D 
reg_D(
      //control in
      .clk(clk),.reset(reset),.stall(stall),
		//data in
		.Instr(Instr),.Pc(Pc),
		//data out
		.InstrD(InstrD),.Pc_D(Pc_D)
		);
//control		
  ControlModule 
con(
   //data in
   .Instr(InstrD),
	//data out
	.RegWriteD(RegWriteD),
	.MemtoRegD(MemtoRegD),
	.BranchD(BranchD),
	.ALUSrcD(ALUSrcD),
	.RegDstD(RegDstD),
	.Extop(Extop),
	.ALUControlD(ALUControlD),
	.NpcopD(NpcopD),
	.jal_sel(jal_sel),
   .T_use_rs(T_use_rs),
	.T_use_rt(T_use_rt),
	.T_new(T_new)
	);
//npc		
  Npcmodule 
npcmodule(
          //control sign in
          .NPcop(NpcopD),.Zero(Zero),
			 //data in
			 .Pc(Pc),.Pc_D(Pc_D),.InstrD(InstrD),.Radata(D_V1),
			 //data out
			 .NPc(NPc)
			 );	 
//grf		
  RF 
rf(
   //control in
   .clk(clk),.reset(reset),.jal_sel(jal_selW),.WE(RegWriteW),
	//data in
   .A1(RsD),.A2(RtD),.A3(WriteRegW),.WD(ResultW),.Pc(PcW),
	//data out
	.RD1(RD1),.RD2(RD2)
	);
//ext imm16
  Extend 
extend(
      //control sign in
      .Signed(Extop),
	   //data in
      .imm16(imm16),
		//data out
		.imm32(imm32)
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
	 .jal_selD(jal_sel),
	 .T_new(T_new),
    //data in
    .D_V1(D_V1),
	 .D_V2(D_V2),
	 .RtD(RtD),
	 .RsD(RsD),
	 .RdD(RdD),
	 .PcD(Pc_D),
	 .imm32(imm32),
	 .InstrD(InstrD),
	 //data out
	 .E_V1(E_V1),
	 .E_V2(E_V2),
	 .RtE(RtE),
	 .RsE(RsE),
	 .RdE(RdE),
	 .PcE(PcE),
	 .imm32E(imm32E),
	 //control sign out
	 .jal_selE(jal_selE),
	 .T_new_E(T_new_E),
	 .InstrE(InstrE)
	 );

  Reg_E2 
reg_E2(
      //control in
		.clk(clk),
		.reset(reset),
		.stall(stall),
		//control sign in
      .RegWriteD(RegWriteD),
		.MemtoRegD(MemtoRegD),
		.ALUsrcD(ALUSrcD),
		.RegDstD(RegDstD),
      .ALUcontrolD(ALUControlD),
		//control out
		.RegWriteE(RegWriteE),
		.MemtoRegE(MemtoRegE),
		.ALUsrcE(ALUSrcE),
		.RegDstE(RegDstE),
		.ALUcontrolE(ALUControlE)
      );
//转发 E级
assign S1=(RsE==0)?0://0寄存器恒为0
          //M级转发
          (WriteRegM==RsE&&RegWriteM==1&&MemtoRegM==0)?ALUOutM://M级为写入寄存器且写入地址为RsE
          (RsE==31&&jal_selM==1)?PcM+8://M级为jal且RsE为31号寄存器
			 //W级转发
          (WriteRegW==RsE&&RegWriteW==1)?ResultW://W级为写寄存器且写入为RsE
			 (RsE==31&&jal_selW==1)?PcW+8://W级为jal且RsE为31号寄存器
			 //不转发
			 E_V1;
assign S2=(ALUSrcE==1)?imm32E:
          (RtE==0)?0://0寄存器恒为0
			 //M级转发
          (WriteRegM==RtE&&RegWriteM==1&&MemtoRegM==0)?ALUOutM://M级为写入寄存器且写入地址为RtE
			 (RtE==31&&jal_selM==1)?PcM+8://M级为jal且RsE为31号寄存器
			 //W级转发
          (WriteRegW==RtE&&RegWriteW==1)?ResultW://W级为写寄存器且写入为RtE
			 (RtE==31&&jal_selW==1)?PcW+8://W级为jal且RtE为31号寄存器
			 //不转发
			 E_V2;
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
assign WriteDataE=(WriteRegM==RtE&&RegWriteM==1&&MemtoRegM==0)?ALUOutM:
                  (WriteRegW==RtE&&RegWriteW==1)?ResultW:E_V2;	
//Addr of grf to write in						
assign WriteRegE=(RegDstE==0)?RtE:RdE;	


//M include DM
  Reg_M 
reg_M(
   //control in
	.clk(clk),
	.reset(reset),
	//control sign in
   .RegWriteE(RegWriteE),
	.MemtoRegE(MemtoRegE),
	.ALUResult(ALUResult),
	.WriteDataE(WriteDataE),
	.WriteRegE(WriteRegE),
	.T_new_E(T_new_E),
	.jal_selE(jal_selE),
	//data in
	.PcE(PcE),
	.E_A2(RtE),
	.InstrE(InstrE),
	//control sign out
	.RegWriteM(RegWriteM),
	.MemtoRegM(MemtoRegM),
	.ALUOutM(ALUOutM),
	.WriteDataM(WriteDataM),	
	.WriteRegM(WriteRegM),
	.T_new_M(T_new_M),
	.jal_selM(jal_selM),
	//data out
	.PcM(PcM),
	.M_A2(RtM),
	.InstrM(InstrM)
    );		  
assign m_data_addr=ALUOutM;
//转发 M级
assign Dm_in= (RtM==0)?0://0寄存器恒为零
              //W级转发
              (WriteRegW==RtM&&RegWriteW==1)?ResultW://W级为写入寄存器且写入RtM
              (RtM==31&&jal_selW==1)?PcW+8://W级为jal且RtM=31
				  //不转发
              WriteDataM;
assign m_data_wdata=(InstrM[31:26]==6'b101011)?Dm_in:
                    (InstrM[31:26]==6'b101001)?{2{Dm_in[15:0]}}:
						                             {4{Dm_in[7:0]}};													
//BE
BE 
   be(
     .Addr10(m_data_addr[1:0]),
	  .StType(InstrM[31:26]),//判断M级指令类型 SW,SH,SB
	  .ByteEn(m_data_byteen)
     );

//DM	
  DM 
dm(
   //control in
	.clk(clk),.Reset(reset),
	//control sign in
	.m_data_byteen(m_data_byteen),
	//data in
	.m_data_addr(m_data_addr),
   .m_data_wdata(m_data_wdata),
   .PcM(PcM),
	//data out
   .Dm_out(Dm_out)
  );
//DMEXT 
DMEXT 
  dmext(
    .Addr10(m_data_addr[1:0]),
	 .LdType(InstrM[31:26]),//判断M级指令类型 LW,LH,LB
	 .RData(Dm_out),
	 .Data(ReadDataM)
  );
  
//W include nothing
Reg_W 
  reg_W(
       //control in
       .clk(clk),.reset(reset),
		 //control sign in
		 .RegWriteM(RegWriteM),
		 .MemtoRegM(MemtoRegM),
		 .ALUOutM(ALUOutM),
		 .ReadDataM(ReadDataM),
		 .WriteRegM(WriteRegM),
		 .T_new_M(T_new_M),
		 .jal_selM(jal_selM),
		 //data in
		 .PcM(PcM),
		 .InstrM(InstrM),
		 //control sign out
		 .RegWriteW(RegWriteW),
		 .MemtoRegW(MemtoRegW),
       .ALUOutW(ALUOutW),
		 .ReadDataW(ReadDataW),
		 .WriteRegW(WriteRegW),
		 .T_new_W(T_new_W),
		 .jal_selW(jal_selW),
		 //data out
		 .PcW(PcW),
		 .InstrW(InstrW)
       );
		 
assign ResultW=(MemtoRegW==1)?ReadDataW:ALUOutW;
//清空延迟槽： 将D级清空，其他不变，必须在不阻塞的时候进行， 控制信号为flush在D级产生，和Beq类似
//相当于将D级的指令变为NOP  例如以下指令

//b...
//add $3, $3, $3
//add $2, $2, $2
//如果第一条指令具有“清空延迟槽”的效果，那么其具体的实现应当是

//b...
//nop
//add $2, $2, $2

endmodule 