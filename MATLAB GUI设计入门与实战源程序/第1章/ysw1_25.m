% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
%% ���ȷֲ�
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
x=rand(100000,1);
hist(x,30);
%%
x=randn(10000,1);  % 100000��1��
hist(x,50);

%%
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
x=poissrnd(10,1000000,1); % lambda = 2
hist(x,50);






