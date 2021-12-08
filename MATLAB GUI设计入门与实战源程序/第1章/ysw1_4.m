% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
ysw.y1{1} = [1,2];
ysw.y2{1} = [3,2];
disp(ysw)  % 显示结构体

for i =1:2
    ysw.y3{i} = i;
    if i==2
        ysw.y = i^2; 
    end
end
disp(ysw)  % 显示结构体
