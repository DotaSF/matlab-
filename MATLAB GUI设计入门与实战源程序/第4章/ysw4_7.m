% ������ɫ���
clc,clear,close all % ���
warning off         % ȡ������
feature jit off     % ���ٴ���ִ��
x=linspace(0,10,50);
y=sin(x).*exp(-x/5);
fill(x,y,'r') % ����ɫ
text(4,0.01,'��ɫ')

%%
t = (1/16:1/8:1)'*2*pi;
x = sin(t);
y = cos(t);
fill(x,y,'r')
axis square



