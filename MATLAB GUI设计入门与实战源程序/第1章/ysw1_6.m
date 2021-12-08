function ysw1_6
% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
t_final=100;      % 终止时间
x0=[0;0;1e-10];   % 初值
[t,x]=ode45(@lorenzeq,[0,t_final],x0);    % 龙格库塔法 
figure('color',[1,1,1]);                   % 先建图形窗口
subplot(211),plot(t,x);                    % 根轨迹图
subplot(212),plot3(x(:,1),x(:,2),x(:,3));  % 3D曲线图
axis([10,42,-20,20,-20,25]);   % 坐标轴显示范围设置
colormap(jet)  % 颜色
shading interp % 消隐
end

function xdot=lorenzeq(t,x)
xdot=[-8/3*x(1)+x(2)*x(3);
    -10*x(2)+10*x(3);-x(1)*x(2)+28*x(2)-x(3)];
end




