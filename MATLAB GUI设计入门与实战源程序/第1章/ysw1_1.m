% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
y1 = [182,8037,8241]
y2 = [117,406,3087]
y3 = y1 + y2  % 加法
y4 = y1 - y2  % 减法

y5 = y1.*y2  % 乘法，元素对应相乘
y6 = y1./y2  % 除法，元素对应相除

y7 = y1.^2     % 平方运算
y8 = y1.^(1/2) % 开方运算

y9 = y1'*y2   % 乘法，矩阵乘法  y1'表示y1的转置
y10 = y1/y2   % 除法，矩阵相除  y1'表示y1的转置

y11 = [y1;y2;y2];
inv(y11)







