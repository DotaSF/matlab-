% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
f=[-25,-40,-61];  % Ŀ�귽��ϵ��
A =[1 -1  1;      % ����ʽԼ�����ϵ��
    3  2  4;
    3  2  0];
b = [20; 42; 30];  % b
lb = zeros(3,1);   % ���޴��ڵ���0
[x,object] = linprog(f,A,b,[],[],lb,[])
toc  % ��ʱ����'

