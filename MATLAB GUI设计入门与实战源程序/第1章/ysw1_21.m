% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format shortE
tic  % 运算计时
A=[9,-1,-1;
    -1,8,0;
    -1,0,9];
b=[7,7,8]';
x0 = [0,0.1,0.1]';
[x,n]=jacobi(A,b,x0,eps)  % 采用Jacobi迭代法求线性方程组Ax=b的解
toc  % 计时结束'

 
 