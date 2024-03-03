`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:23 12/11/2022 
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
    input clk,                    // 时钟信号
    input reset,                  // 同步复位信号
    input interrupt,              // 外部中断信号
    output [31:0] macroscopic_pc, // 宏观 PC

    output [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input  [31:0] i_inst_rdata,   // IM 读取数据

    output [31:0] m_data_addr,    // DM 读写地址
    input  [31:0] m_data_rdata,   // DM 读取数据
    output [31:0] m_data_wdata,   // DM 待写入数据
    output [3 :0] m_data_byteen,  // DM 字节使能信号

    output [31:0] m_int_addr,     // 中断发生器待写入地址
    output [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output [31:0] m_inst_addr,    // M 级 PC

    output w_grf_we,              // GRF 写使能信号
    output [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output [31:0] w_grf_wdata,    // GRF 待写入数据

    output [31:0] w_inst_addr     // W 级 PC 
);

wire [5:0] Type;
wire [31:0] CPUInData,CPUOutAddr;
wire [31:0] CPUOutData;
wire [3:0] CPUByteEn;
wire [31:2] AddrTime0,AddrTime1;
wire [31:0] WDTime0,WDTime1,Time0Out,Time1Out;
wire IRQ0,IRQ1,Req;
wire [5:0] HWInt;
wire [4:0] M_ExcCode,M_ExcCodeFixed;
wire WETime0,WETime1;
wire WETime0tmp,WETime1tmp;
wire [3:0] m_data_byteentmp;
assign m_data_byteen=(Req)? 4'b0:m_data_byteentmp;
assign WETime0=(Req)?0:WETime0tmp;
assign WETime1=(Req)?0:WETime1tmp;
CPU
 cpu(
 .clk(clk),
 .reset(reset),
 .HWInt(HWInt),
 .i_inst_rdata(i_inst_rdata),
 .i_inst_addr(i_inst_addr),
 .m_inst_addr(m_inst_addr),
 .macroscopic_pc(macroscopic_pc),
 .w_grf_we(w_grf_we),
 .w_grf_addr(w_grf_addr),
 .w_grf_wdata(w_grf_wdata),
 .w_inst_addr(w_inst_addr),
 .CPUInData(CPUInData),
 .CPUOutAddr(CPUOutAddr),
 .CPUOutData(CPUOutData),
 .CPUByteEn(CPUByteEn),
 .CPUM_ExcCode(M_ExcCode),
 .CPUM_ExcCodeFixed(M_ExcCodeFixed),
 .Type(Type),
 .CPUReq(Req)
 );
Timer 
 Timer0(
   .clk(clk),
	.reset(reset),
	.Addr(AddrTime0),
	.WE(WETime0),
	.Din(WDTime0),
	.Dout(Time0Out),
	.IRQ(IRQ0)
 );
Timer 
 Timer1(
   .clk(clk),
	.reset(reset),
	.Addr(AddrTime1),
	.WE(WETime1),
	.Din(WDTime1),
	.Dout(Time1Out),
	.IRQ(IRQ1)
 );
Bridge
 Bridge(
   .Addr(CPUOutAddr),
	.CPUOutData(CPUOutData),
	.CPUByteEn(CPUByteEn),
	.CPUInData(CPUInData),
	.Dm_Data(m_data_rdata),
	.Dm_WD(m_data_wdata),
   .Dm_Addr(m_data_addr),
	.Dm_En(m_data_byteentmp),
	.T0_Data(Time0Out),
	.IRQ0(IRQ0),
	.T0_WD(WDTime0),
	.T0_Addr(AddrTime0),
	.T0_En(WETime0tmp),
	.T1_Data(Time1Out),
	.IRQ1(IRQ1),
	.T1_WD(WDTime1),
	.T1_Addr(AddrTime1),
	.T1_En(WETime1tmp),
	.m_int_addr(m_int_addr),
	.m_int_ByteEn(m_int_byteen),
	.interrupt(interrupt),
	.Type(Type),
	.M_ExcCode(M_ExcCode),
	.M_ExcCodeFixed(M_ExcCodeFixed),
	.HWInt(HWInt)
 );
endmodule 
