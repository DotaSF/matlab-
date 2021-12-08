clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format shortg       % 数据类型

t1=0:2;
t2=3:18;
t3=19:20;
p1=[780 1230 1290];
p2=[1410 1320 1050 1230 990 1590 1200 2700 1170 1260 1225.531915 1290 1290 23.47826087 1800 1425];
p3=[3306.122449 2533.333333];

t=[t1,t2,t3];
p=[p1,p2,p3];
% plot(t,p,'linewidth',2);
% x1 = linspace(min(t), max(t));
% fit1 = polyfit(t, p, 8);
% y1 = polyval(fit1, x1);
% hold on
% plot(x1,y1,'r')
%% 线性拟合
createfigure(t, p)
%% 2次拟合
createfigure1(t, p)
%% 3次拟合
createfigure2(t, p)
%% 4次拟合
createfigure3(t, p)
%% 5次拟合
createfigure4(t, p)
%% 6次拟合
createfigure5(t, p)
%% 7次拟合
createfigure6(t, p)
%% 8次拟合
createfigure7(t, p)




 













