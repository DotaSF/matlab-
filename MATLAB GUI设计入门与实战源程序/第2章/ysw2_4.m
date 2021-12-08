% Designed by Yu Shengwei From SWJTU University
% 2015年2月2日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
% data = xlsread('ysw.xlsx','Sheet1') % 读EXCEL
ysw = [1,1,7,4,0,6,3,0,8,7];
xlswrite('ysw1.xlsx',ysw)
% 写完数据后，读取数据
data = xlsread('ysw1.xlsx','Sheet1') % 读EXCEL
toc  % 计时结束

xlswrite('ysw1.xlsx',ysw,'yswysw')

%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
filename = 'ysw2.xlsx';   % EXCEL文件名称
A = {'Time','Temperature'; 11,7; 40,6; 30,87};
sheet = 3;       % 第三个工作薄上写数据
xlRange = 'B1';  % 从B1列开始写入数据A
xlswrite(filename,A,sheet,xlRange)  % 写数据开始

xlRange = 'E1';  % 从B1列开始写入数据A
xlswrite(filename,A,sheet,xlRange)  % 写数据开始
%%
filename = 'ysw2.xlsx';   % EXCEL文件名称
A = {92.0,'Yes',45.9,'No'};
sheet = 3;       % 第三个工作薄上写数据
xlRange = 'E1';  % 从B1列开始写入数据A
xlswrite(filename,A,sheet,xlRange)  % 写数据开始


















