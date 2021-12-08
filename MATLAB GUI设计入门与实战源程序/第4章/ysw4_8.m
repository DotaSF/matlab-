% 区域颜色填充
clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
t=linspace(0,2*pi,10);
x=sin(2*t);
y=cos(2*t);
area(x,y,'facecolor','r')

%%
Y = [1, 5, 3;
     3, 2, 7;
     1, 5, 3;
     2, 6, 1];
figure
area(Y)
%%
Y = [1, 5, 3;
     3, 2, 7;
     1, 5, 3;
     2, 6, 1];
figure
basevalue = -4;
area(Y,basevalue)
%%
Y = [1, 5, 3;
     3, 2, 7;
     1, 5, 3;
     2, 6, 1];

figure
h = area(Y,'LineStyle',':',...
           'LineWidth',2);
set(h(1),'FaceColor',[0,0.25,0.25]);
set(h(2),'FaceColor',[0,0.5,0.5]);
set(h(3),'FaceColor',[0,0.75,0.75]);    


       
