% Designed by Yu Shengwei From SWJTU University
% 2015年1月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
data = xlsread('ysw.xlsx','Sheet1')
toc  % 计时结束
%%
data = xlsread('ysw.xlsx','Sheet1','A1:D3')

%%
tic                 % 运算计时
data = xlsread('ysw.xlsx','ysw1','A1:D11')
toc  % 计时结束




