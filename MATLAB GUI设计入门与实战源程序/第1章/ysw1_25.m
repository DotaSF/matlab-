% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
%% 均匀分布
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
x=rand(100000,1);
hist(x,30);
%%
x=randn(10000,1);  % 100000行1列
hist(x,50);

%%
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
x=poissrnd(10,1000000,1); % lambda = 2
hist(x,50);






