% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 

y = @(s,w)s+w ;  % 加法运算
y1 = y(1,2)
y2 = y(117,4063087)
y3 = y(182803,78241)

for i =1:10
    ysw(i) = y(i^2,2*i+1);  % 加法运算
end
plot(ysw,'linewidth',2)
grid on
haxes2=axes('position',[0.3,0.5,0.3,0.3]);
axis(haxes2);
plot(ysw,'ro--');

