clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format shortg       % ��������

t1=0:2;
t2=3:18;
t3=19:20;
p1=[780 1230 1290];
p2=[1410 1320 1050 1230 990 1590 1200 2700 1170 1260 1225.531915 1290 1290 23.47826087 1800 1425];
p3=[3306.122449 2533.333333];

t=[t1,t2,t3];
p=[p1,p2,p3];
% plot(t,p,'linewidth',2);
% x1 = linspace(min(t), max(t));
% fit1 = polyfit(t, p, 8);
% y1 = polyval(fit1, x1);
% hold on
% plot(x1,y1,'r')
%% �������
createfigure(t, p)
%% 2�����
createfigure1(t, p)
%% 3�����
createfigure2(t, p)
%% 4�����
createfigure3(t, p)
%% 5�����
createfigure4(t, p)
%% 6�����
createfigure5(t, p)
%% 7�����
createfigure6(t, p)
%% 8�����
createfigure7(t, p)




 













