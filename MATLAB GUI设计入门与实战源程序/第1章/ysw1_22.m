% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
f=[-25,-40,-61];  % 目标方程系数
A =[1 -1  1;      % 不等式约束左侧系数
    3  2  4;
    3  2  0];
b = [20; 42; 30];  % b
lb = zeros(3,1);   % 下限大于等于0
[x,object] = linprog(f,A,b,[],[],lb,[])
toc  % 计时结束'

