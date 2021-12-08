% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
%% nearest
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi,'nearest');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','nearest插值')
toc  % 计时结束

%% linear
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi);
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','linear插值')
toc  % 计时结束
%% spline
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi,'spline');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','spline插值')
toc  % 计时结束
%% pchip
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi,'pchip');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','pchip插值')
toc  % 计时结束

%% cubic
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi,'cubic');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','cubic插值')
toc  % 计时结束

%% v5cubic
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % 原数图形
xi = 1:0.1:10;
yi = interp1(x,y,xi,'v5cubic');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % 原数图形
xlabel('x');  ylabel('y');  
legend('原始数据','v5cubic插值')
toc  % 计时结束




