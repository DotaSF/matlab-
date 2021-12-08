% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
fun='x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2)';     %目标函数
x0=[0 1];   % 初值
A=[-2 3];   % 线性不等式约束
b=6;        % 线性不等式约束
Aeq=[ ];    % 无线性等式约束
beq=[ ];    % 无线性等式约束
lb=[ ];     % x没有下界
ub=[ ];     % x没有上界
[x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,@non_constraint)
toc  % 计时结束'
