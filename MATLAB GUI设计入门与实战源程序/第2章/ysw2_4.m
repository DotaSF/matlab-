% Designed by Yu Shengwei From SWJTU University
% 2015��2��2��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
% data = xlsread('ysw.xlsx','Sheet1') % ��EXCEL
ysw = [1,1,7,4,0,6,3,0,8,7];
xlswrite('ysw1.xlsx',ysw)
% д�����ݺ󣬶�ȡ����
data = xlsread('ysw1.xlsx','Sheet1') % ��EXCEL
toc  % ��ʱ����

xlswrite('ysw1.xlsx',ysw,'yswysw')

%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
filename = 'ysw2.xlsx';   % EXCEL�ļ�����
A = {'Time','Temperature'; 11,7; 40,6; 30,87};
sheet = 3;       % ��������������д����
xlRange = 'B1';  % ��B1�п�ʼд������A
xlswrite(filename,A,sheet,xlRange)  % д���ݿ�ʼ

xlRange = 'E1';  % ��B1�п�ʼд������A
xlswrite(filename,A,sheet,xlRange)  % д���ݿ�ʼ
%%
filename = 'ysw2.xlsx';   % EXCEL�ļ�����
A = {92.0,'Yes',45.9,'No'};
sheet = 3;       % ��������������д����
xlRange = 'E1';  % ��B1�п�ʼд������A
xlswrite(filename,A,sheet,xlRange)  % д���ݿ�ʼ


















