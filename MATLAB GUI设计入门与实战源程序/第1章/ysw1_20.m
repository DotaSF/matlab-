% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format shortE
tic  % �����ʱ
A = [6,2,-1;
    1,4,-2;
    -3,1,4];  % ����ϵ������
b = [-3,2,4]';
x0 = [-0.5,0.5,0.25]';
% gauss_seidel���
y = gauss_seidel_x(A,b,x0,eps)
toc  % ��ʱ����'
