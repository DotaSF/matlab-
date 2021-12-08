% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format shortE
tic  % 运算计时
x = linspace(2,4,200);       % 对自变量取样
y = Newton_fun_diff(x);      % 计算各点的函数值
plot(x,y,'linewidth',2);     % 绘制函数y(x)曲线
hold on;
plot(xlim,[0,0],'m:');       % 绘制零刻度线
x0 = 3;                      % 初始化解的位置
xj=Newton_dd('Newton_fun_diff',x0)    % 牛顿求根，初始点是3
digits(6),  % 数据精度
vpa(xj)     % 显示xj解
plot(xj,Newton_fun_diff(xj),'rs');    % 绘制解对应的点
toc  % 计时结束'



