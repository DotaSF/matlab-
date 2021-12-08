% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8]';
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
mesh(x,y,Z)
xlabel('x'); ylabel('y'); zlabel('z')
toc  % 计时结束'

%% nearest
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % 插值数据
yi = min(y):(max(y)-min(y))/50:max(y);  % 插值数据
yi = yi'; % 转置
Zi = griddata(x,y,Z,xi,yi,'nearest');   % 插值
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('nearest插值')
toc  % 计时结束

%% linear
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % 插值数据
yi = min(y):(max(y)-min(y))/50:max(y);  % 插值数据
yi = yi'; % 转置
Zi = griddata(x,y,Z,xi,yi,'linear');   % 插值
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('linear插值')
toc  % 计时结束

%% cubic
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % 插值数据
yi = min(y):(max(y)-min(y))/50:max(y);  % 插值数据
yi = yi'; % 转置
Zi = griddata(x,y,Z,xi,yi,'cubic');   % 插值
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('spline插值')
toc  % 计时结束

