% Designed by Yu Shengwei From SWJTU University
% 2014��1��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
load('data.mat')
toc  % ��ʱ����

%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
I = imread('me.jpg');
toc  % ��ʱ����
save I.mat I
%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
load('I.mat')
toc  % ��ʱ����

