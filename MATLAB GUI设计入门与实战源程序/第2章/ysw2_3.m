% Designed by Yu Shengwei From SWJTU University
% 2015��1��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
data = xlsread('ysw.xlsx','Sheet1')
toc  % ��ʱ����
%%
data = xlsread('ysw.xlsx','Sheet1','A1:D3')

%%
tic                 % �����ʱ
data = xlsread('ysw.xlsx','ysw1','A1:D11')
toc  % ��ʱ����




