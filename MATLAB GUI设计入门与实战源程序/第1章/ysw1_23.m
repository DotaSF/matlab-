% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
[x,fval,exitflag,output]=fminbnd('(4*x^3+2*cos(x)+3*x*log(x))/(2*exp(x))',0,1)
toc  % ��ʱ����'

