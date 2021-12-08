% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 1:0.1:10;
y = x.^2 + max(x)*sin(x);
plot(x,y)
grid on
grid off

%% 曲面ｓｕｒｆ
% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
[x,y] = meshgrid([1:0.1:10],[1:0.1:10]);
z = x.^2+y.^3.*sin(x);   % Z
figure('color',[1,1,1]) 
surf(x,y,z)              % 曲面
xlabel('x');ylabel('y');zlabel('z');

figure('color',[1,1,1]) 
mesh(x,y,z)              % 曲面
xlabel('x');ylabel('y');zlabel('z');
colormap(jet)  % 颜色
shading interp % 消隐






