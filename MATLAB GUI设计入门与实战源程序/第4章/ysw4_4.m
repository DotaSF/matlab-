clc,clear,close all % ���
warning off         % ȡ������
feature jit off     % ���ٴ���ִ��
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
title('��ͼ');xlabel('ʱ��');ylabel('���');axis([-1 1 -2 2]);
% set(gca,'xtick',[],'ytick',[]) % ͬʱȥ��x���y��Ŀ̶�

%%
set(gca,'yscale','log') %y��Ϊlog
set(gca,'YTickLabel',{'-4','-3','-2','-1','0'});
set(gca,'XTickLabel',{'-4','-3','-2','-1','0'});

%%
set(gca, 'XGrid', 'on'); %����
set(gca, 'YGrid', 'on'); %����
%%
set(gca,'XDir','reverse') % ���÷���
set(gca,'YDir','reverse') % ���÷���



