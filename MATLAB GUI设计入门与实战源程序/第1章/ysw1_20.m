% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format shortE
tic  % 运算计时
A = [6,2,-1;
    1,4,-2;
    -3,1,4];  % 方程系数矩阵
b = [-3,2,4]';
x0 = [-0.5,0.5,0.25]';
% gauss_seidel求解
y = gauss_seidel_x(A,b,x0,eps)
toc  % 计时结束'
