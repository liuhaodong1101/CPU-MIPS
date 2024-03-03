`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:55 12/09/2022 
// Design Name: 
// Module Name:    CP0 
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
`define IM SR[15:10]//�ֱ��Ӧ�����ⲿ�жϣ���Ӧλ�� 1 ��ʾ�����жϣ��� 0 ��ʾ��ֹ�жϡ�����һ�������Ĺ��ܣ�ֻ��ͨ�� mtc0 ���ָ���޸ģ�ͨ���޸�������������ǿ�������һЩ�жϡ�
`define EXL SR[1]//�κ��쳣����ʱ��λ�����ǿ�ƽ������̬��Ҳ���ǽ����쳣������򣩲���ֹ�жϡ�
`define IE SR[0]//ȫ���ж�ʹ�ܣ���λ�� 1 ��ʾ�����жϣ��� 0 ��ʾ��ֹ�жϡ�
`define BD Cause[31]//����λ�� 1 ��ʱ��EPC ָ��ǰָ���ǰһ��ָ�һ��Ϊ��ת��������ָ��ǰָ�
`define IP Cause[15:10]//Ϊ 6 λ�������ж�λ���ֱ��Ӧ 6 ���ⲿ�жϣ���Ӧλ�� 1 ��ʾ���жϣ��� 0 ��ʾ���жϣ�����ÿ�����ڱ��޸�һ�Σ��޸ĵ��������Լ�ʱ�����ⲿ�жϡ�
`define ExcCode Cause[6:2]//�쳣���룬��¼��ǰ��������ʲô�쳣��
`define SRNum 12
`define CauseNum 13
`define EPCNum 14
module CP0(
   output CU0,
	output EXLL,
	input clk,
	input reset,
	input en,//дʹ�ܣ�ֻ��дSR��EPC
	input BDIn,//�ж��ǲ����ӳٲ�ָ��
	input EXLClr,//������λ EXL
	input [4:0] CP0Add,//���Ĵ��������Զ���SR,Cause��EPC
	input [31:0] CP0In,//CP0 д�����ݣ�mtC0ʹ�ã�����д��Cause
	input [31:0] VPC,//�ܺ� PC
	input [4:0] ExcCodeIn,//��¼�쳣����
	input [5:0] HWInt,//�����ж��ź�
	output [31:0] EPCOut,//EPC ��ֵ
	output [31:0] CP0Out,//CP0 ��������
	output Req//�����жϴ����������
	
    );
reg [31:0] SR,Cause;
assign CU0=SR[28];
reg [31:0] EPC;//��¼�쳣�����������Ҫ���ص� PC��
wire InReq = ((HWInt&`IM)!=6'b0)&&(`EXL==0)&&(`IE==1);//�ⲿ�ж�
wire ExcReq = (ExcCodeIn!=5'b0)?1'b1:1'b0;//�ڲ��쳣
//�ж��Ƿ��ж�
assign Req= ExcReq||InReq;
//�ֶ���
assign EPCOut=EPC;
//mfC0
assign CP0Out= (CP0Add==`SRNum)? 			SR:
					(CP0Add==`CauseNum)?		Cause:
					(CP0Add==`EPCNum)?	     EPC:
													32'bx;
//for SR					
always@(posedge clk)begin
	if(reset) begin 
	SR<=32'h1000_0000;
	end
	else begin
	  if(EXLClr) `EXL<=1'b0;
	  if(Req) `EXL<=1'b1;
	  else if(en&&CP0Add==`SRNum) SR<=CP0In;
	end
end					
//for Cause
always@(posedge clk)begin
	if(reset) Cause<=0;
	else begin
	   `IP<=HWInt;
		if(Req) begin
				`ExcCode<=(InReq)?5'b0:ExcCodeIn;
				`BD<=BDIn;
			end
	end
end
//for EPC
always@(posedge clk)begin
	if(reset) EPC<=0;
	else if(Req)begin
		if(BDIn) EPC<=VPC-32'b100;
		else EPC<=VPC;
	end
	else if(en&&CP0Add==`EPCNum) begin
		EPC<=CP0In;
	end
	
end
assign EXLL=`EXL;
endmodule
