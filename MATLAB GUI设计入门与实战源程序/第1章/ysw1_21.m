% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format shortE
tic  % �����ʱ
A=[9,-1,-1;
    -1,8,0;
    -1,0,9];
b=[7,7,8]';
x0 = [0,0.1,0.1]';
[x,n]=jacobi(A,b,x0,eps)  % ����Jacobi�����������Է�����Ax=b�Ľ�
toc  % ��ʱ����'

 
 