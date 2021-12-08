% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
[x,fval,exitflag,output]=fminbnd('(4*x^3+2*cos(x)+3*x*log(x))/(2*exp(x))',0,1)
toc  % 计时结束'

