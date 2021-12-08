% 区域颜色填充
clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
x=linspace(0,10,50);
y=sin(x).*exp(-x/5);
fill(x,y,'r') % 填充红色
text(4,0.01,'红色')

%%
t = (1/16:1/8:1)'*2*pi;
x = sin(t);
y = cos(t);
fill(x,y,'r')
axis square



