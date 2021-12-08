clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
N=100;
x=2*round(rand(N,1))-1;
x1 = x';
a = -5.5:1/100:1.5;
b = -3.5:1/100:3.5;
c = -1.5:1/100:5.5;
for i = 1:1:(N+2-11);
    d = x1(1,i)*sinc(b);
    e = x1(1,i+1)*sinc(b);
    f = x1(1,i+2)*sinc(b);
    hold on, plot(a,f);
    hold on, plot(b,e);
    hold on, plot(c,d);
end
axis([-1 1 -2 2]);
title('眼图');xlabel('时间');ylabel('振幅');axis([-1 1 -2 2]);
% set(gca,'xtick',[],'ytick',[]) % 同时去掉x轴和y轴的刻度

%%
set(gca,'yscale','log') %y轴为log
set(gca,'YTickLabel',{'-4','-3','-2','-1','0'});
set(gca,'XTickLabel',{'-4','-3','-2','-1','0'});

%%
set(gca, 'XGrid', 'on'); %网格
set(gca, 'YGrid', 'on'); %网格
%%
set(gca,'XDir','reverse') % 设置方向
set(gca,'YDir','reverse') % 设置方向



