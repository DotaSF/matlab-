% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
P=rand(10000,2);
x=2*P(:,1)-1;
y=2*P(:,2);
points=find(y<=2-x.^2&y.^3>=x.^2);
M=length(points);
S=4*M/10000
figure('color',[1,1,1])
plot(x(points),y(points),'bs')
toc  % 计时结束'


