% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
options = odeset('RelTol',1e-4,'AbsTol',1e-5);
y0 = 1;  % 初值
[T,Y] = ode45(@fun,[4 20],y0,options);
box on                   % 外框盒子边线
grid on                  % 网格化
axis equal               % 轴相等
plot(T,Y,'linewidth',2)  % 画图
toc  % 计时结束'

