% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
options = odeset('RelTol',1e-4,'AbsTol',1e-5);
y0 = 1;  % ��ֵ
[T,Y] = ode45(@fun,[4 20],y0,options);
box on                   % �����ӱ���
grid on                  % ����
axis equal               % �����
plot(T,Y,'linewidth',2)  % ��ͼ
toc  % ��ʱ����'

