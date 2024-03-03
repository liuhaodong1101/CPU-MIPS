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
    input [31:0] m_data_addr,//����д��Ĵ洢����ַ�������ֽ�λ
    input [31:0] m_data_wdata,//����д���ֵ��SB,SH�ѽ��и�����չ
	 input [31:0] PcM,//����ָ���Pc
    output [31:0] Dm_out//��Ӧ�ֵ�ַ�Ĵ洢����ֵ
    );
integer i;
reg [31:0] data_memory[3071:0];	 
reg [31:0] fixed_wdata,fixed_addr;

always @(*) begin
        fixed_wdata = data_memory[m_data_addr >> 2];//�ȶ����洢��ԭ����ֵ
        fixed_addr = m_data_addr & 32'hfffffffc;//�൱��ȡ{m_data_addr[31:2],2'b0}
		  //�����ֽ�ʹ���źŶԶ�����ֵ���ֽڽ����滻
        if (m_data_byteen[3]) fixed_wdata[31:24] = m_data_wdata[31:24];
        if (m_data_byteen[2]) fixed_wdata[23:16] = m_data_wdata[23:16];
        if (m_data_byteen[1]) fixed_wdata[15: 8] = m_data_wdata[15: 8];
        if (m_data_byteen[0]) fixed_wdata[7 : 0] = m_data_wdata[7 : 0];
    end
	 
	 
initial
begin
    for(i=0;i<=3071;i=i+1)
    data_memory[i] <= 0;//ȫ����ʼ��Ϊ0
end

always @(posedge clk) 
begin
  if(Reset==1) 
  begin
    for(i=0;i<=3071;i=i+1) data_memory[i] <= 32'b0;//��λ
  end
  else if (|m_data_byteen)//m_data_byteenֻҪ��һλ��Ϊ0����ζ��MemWrite=1
  begin
    data_memory[fixed_addr >> 2] <= fixed_wdata;
    $display("%d@%h: *%h <= %h", $time, PcM, fixed_addr, fixed_wdata);//��д�ֽڣ�д���ֵ�ʱ��չʾ�����������ֵĵ�ַ���ֵ�ֵ
  end
end

assign Dm_out=data_memory[fixed_addr >> 2];



endmodule
