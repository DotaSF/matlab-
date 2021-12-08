% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
x = [1:10];
y = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
figure('color',[1,1,1])
plot(x,y,'bo-')   % 原始数据
hold on
p = polyfit(x,y,7); % 7次多项式
yc = p(1)*x.^7 + p(2)*x.^6+ p(3)*x.^5 + p(4)*x.^4 + p(5)*x.^3 + p(6)*x.^2 +...
    p(7)*x.^1 + p(8)*x.^0;
plot(x,yc,'r*-')   % 原始数据
legend('原始数据','拟合数据')
xlabel('x');ylabel('y')






