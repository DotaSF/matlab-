% Designed by Yu Shengwei From SWJTU University
% 2015年1月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
A = [1,1,7,4,0,6,3,0,8,7;
    1,8,2,8,0,3,7,8,2,4;
    1,3,6,7,9,6,1,0,0,4;
    1,8,3,8,2,4,5,8,0,7];
A=[1];
%存储数据A
save ysw.txt A -ascii;

toc  % 计时结束

%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
format short        % 数据类型
tic                 % 运算计时
A = [1,1,7,4,0,6,3,0,8,7;
    1,8,2,8,0,3,7,8,2,4;
    1,3,6,7,9,6,1,0,0,4;
    1,8,3,8,2,4,5,8,0,7];
B=[1];
%存储数据A
save ysw.txt A -ascii;
%追加存储数据 N
save ysw.txt B -append -ascii;
toc  % 计时结束

%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
format short        % 数据类型
tic                 % 运算计时
syms y s w
A = [1,8,2,8,0,3,7,8,2,4,1;
    1,3,6,7,9,6,1,0,0,4,1;
    1,8,3,8,2,4,5,8,0,7,4];
%存储数据A
save ysw.txt y %-ascii;
%追加存储数据 N
save ysw.txt A -append -ascii;
toc  % 计时结束

