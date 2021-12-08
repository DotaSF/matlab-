% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
myworld = vrworld('octavia_body.wrl')
open(myworld)
view(myworld)
toc  % 计时结束
%%
close(myworld)
%%
delete(myworld)
%%
vrclear
vrclear('-force')

