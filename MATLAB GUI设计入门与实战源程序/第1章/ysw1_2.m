% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
% 符号矩阵
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




 


