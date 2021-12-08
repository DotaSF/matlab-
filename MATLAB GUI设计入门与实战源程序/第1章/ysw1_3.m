% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
% 元胞数组
ysw{1} = [1,2];
ysw{2} = [3,2];
ysw{3} = [1,4];
celldisp(ysw)  % 显示元胞数组

for i=1:3
    ys{i} = i;
end
celldisp(ys)  % 显示元胞数组