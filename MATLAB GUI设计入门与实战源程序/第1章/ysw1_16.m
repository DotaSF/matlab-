% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
t0=0;  % 时间初始值
tf=20; % 时间终止值
x0=[0,0.25]; % 初始值
[t,x]=ode45('VDP',[t0 tf],x0);
figure(1),
plot(t,x(:,1),':b',t,x(:,2),'-r')
legend('速度','位移')
figure(2),
plot(x(:,1),x(:,2),'linewidth',2);
xlabel('速度');ylabel('位移')
toc  % 计时结束'

