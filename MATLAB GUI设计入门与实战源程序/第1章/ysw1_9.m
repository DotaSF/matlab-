% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,……,10
y = exp(-x).*sin(x);       % 曲线方程
plot(x,y,'r.-')   % 画图
grid off; xlabel('x'); ylabel('y')
text(3,0.1,'e^{-t}sint');
text(5,0.1,'x~{\chi}_{\alpha}^{2}(2)');

%%
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,……,10
y = exp(-0.5*x).*sin(10*x);       % 曲线方程
plot(x,y,'r.-')   % 画图
grid off; xlabel('x'); ylabel('y')
text(4,0.6,'\int \geq  \otimes ');
text(5,0.5,'\neq \perp \Re');
text(6,0.4,'\downarrow \subset  \copyright');


