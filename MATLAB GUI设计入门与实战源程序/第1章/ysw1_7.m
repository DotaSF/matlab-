% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,……,10
y = tan(x);       % 直线方程
plot(x,y,'r.-')   % 画图
grid on; xlabel('x'); ylabel('y')

%% 线型
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 1:5:100;   % 1,6,11,16,……,96
y1 = 1*x;         % 直线方程
y2 = 2*x;         % 直线方程
y3 = 3*x;         % 直线方程
y4 = 4*x;         % 直线方程
y5 = 5*x;         % 直线方程
y6 = 6*x;         % 直线方程
y7 = 7*x;         % 直线方程
y8 = 8*x;         % 直线方程
y9 = 9*x;         % 直线方程
y10 = 10*x;         % 直线方程
figure('color',[1,1,1]);                   % 先建图形窗口
hold on
plot(x,y1,'-')  % 画图
plot(x,y2,'--')  % 画图
plot(x,y3,'.-')  % 画图
plot(x,y4,'*-')  % 画图
plot(x,y5,'s-')  % 画图
plot(x,y6,'p-')  % 画图
plot(x,y7,'>-')  % 画图
plot(x,y8,'<-')  % 画图
plot(x,y9,'h-')  % 画图
plot(x,y10,'o-')  % 画图
grid on; xlabel('x'); ylabel('y')
haxes2=axes('position',[0.2,0.6,0.3,0.3]);
axis(haxes2);
hold on
plot(x(5:6),y1(5:6),'-')  % 画图
plot(x(5:6),y2(5:6),'--')  % 画图
plot(x(5:6),y3(5:6),'.-')  % 画图
plot(x(5:6),y4(5:6),'*-')  % 画图
plot(x(5:6),y5(5:6),'s-')  % 画图
plot(x(5:6),y6(5:6),'p-')  % 画图
plot(x(5:6),y7(5:6),'>-')  % 画图
plot(x(5:6),y8(5:6),'<-')  % 画图
plot(x(5:6),y9(5:6),'h-')  % 画图
plot(x(5:6),y10(5:6),'o-')  % 画图

%% 颜色
figure('color',[1,1,1]);                   % 先建图形窗口
hold on
plot(x,y1,'r-')  % 画图
plot(x,y2,'g--')  % 画图
plot(x,y3,'b.-')  % 画图
plot(x,y4,'k*-')  % 画图
plot(x,y5,'cs-')  % 画图
plot(x,y6,'mp-')  % 画图
plot(x,y7,'w>-')  % 画图
plot(x,y8,'y<-')  % 画图
grid on; xlabel('x'); ylabel('y')
haxes2=axes('position',[0.2,0.6,0.3,0.3]);
axis(haxes2);
hold on
plot(x(5:6),y1(5:6),'r-','linewidth',2)  % 画图
plot(x(5:6),y2(5:6),'g--','linewidth',2)  % 画图
plot(x(5:6),y3(5:6),'b.-','linewidth',2)  % 画图
plot(x(5:6),y4(5:6),'k*-','linewidth',2)  % 画图
plot(x(5:6),y5(5:6),'cs-','linewidth',2)  % 画图
plot(x(5:6),y6(5:6),'mp-','linewidth',2)  % 画图
plot(x(5:6),y7(5:6),'w>-','linewidth',2)  % 画图
plot(x(5:6),y8(5:6),'y<-','linewidth',2)  % 画图

