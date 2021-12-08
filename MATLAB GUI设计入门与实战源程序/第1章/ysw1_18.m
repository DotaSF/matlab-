% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = -5:1:5;      % x
y = 1./(1+x.*x); % y
% 精确解曲线
xj = -5:0.1:5;       % 待插值的x
yj = 1./(1+xj.*xj);  % 精确解
plot(xj,yj,'linewidth',2) % 画图
hold on                   % 图形保持句柄
% 高次多项式插值
for i = 1:length(xj)
    disp([strcat('当前插值点数为  ',num2str(i)),   strcat('总插值点数为  ',num2str(length(xj)))])
    yc(i) = Newton_interp(x,y,xj(i));
end
plot(xj,yc,'r--','linewidth',2)
grid on;xlabel('x'),ylabel('y')
legend('原数据曲线','牛顿插值曲线')
toc  % 计时结束'

