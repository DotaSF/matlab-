% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
% ���ž���
ysw1 = sym('ysw1')
r = sym(1/3)
f = sym(1/3, 'f')
d = sym(1/3, 'd')
e = sym(1/3, 'e')

%%
syms ysw1 ysw2
syms f(x, y)
f(x, y) = 1*x + 2*y
f(1, 2)




 


