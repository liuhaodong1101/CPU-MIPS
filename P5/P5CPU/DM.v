`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:05 11/08/2022 
// Design Name: 
// Module Name:    DM 
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
`define LW 6'b100011
`define LH 6'b100001
`define LB 6'b100000
module DM(
    input clk,
    input Reset,
	 input [3:0] m_data_byteen,
    input [31:0] m_data_addr,//即将写入的存储器地址，包括字节位
    input [31:0] m_data_wdata,//即将写入的值，SB,SH已进行复制扩展
	 input [31:0] PcM,//该条指令的Pc
    output [31:0] Dm_out//对应字地址的存储器的值
    );
integer i;
reg [31:0] data_memory[3071:0];	 
reg [31:0] fixed_wdata,fixed_addr;

always @(*) begin
        fixed_wdata = data_memory[m_data_addr >> 2];//先读出存储器原来的值
        fixed_addr = m_data_addr & 32'hfffffffc;//相当于取{m_data_addr[31:2],2'b0}
		  //根据字节使能信号对读出的值按字节进行替换
        if (m_data_byteen[3]) fixed_wdata[31:24] = m_data_wdata[31:24];
        if (m_data_byteen[2]) fixed_wdata[23:16] = m_data_wdata[23:16];
        if (m_data_byteen[1]) fixed_wdata[15: 8] = m_data_wdata[15: 8];
        if (m_data_byteen[0]) fixed_wdata[7 : 0] = m_data_wdata[7 : 0];
    end
	 
	 
initial
begin
    for(i=0;i<=3071;i=i+1)
    data_memory[i] <= 0;//全部初始化为0
end

always @(posedge clk) 
begin
  if(Reset==1) 
  begin
    for(i=0;i<=3071;i=i+1) data_memory[i] <= 32'b0;//复位
  end
  else if (|m_data_byteen)//m_data_byteen只要有一位不为0就意味着MemWrite=1
  begin
    data_memory[fixed_addr >> 2] <= fixed_wdata;
    $display("%d@%h: *%h <= %h", $time, PcM, fixed_addr, fixed_wdata);//在写字节，写半字的时候展示的是完整的字的地址和字的值
  end
end

assign Dm_out=data_memory[fixed_addr >> 2];



endmodule
