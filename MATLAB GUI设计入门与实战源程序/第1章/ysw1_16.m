% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
t0=0;  % ʱ���ʼֵ
tf=20; % ʱ����ֵֹ
x0=[0,0.25]; % ��ʼֵ
[t,x]=ode45('VDP',[t0 tf],x0);
figure(1),
plot(t,x(:,1),':b',t,x(:,2),'-r')
legend('�ٶ�','λ��')
figure(2),
plot(x(:,1),x(:,2),'linewidth',2);
xlabel('�ٶ�');ylabel('λ��')
toc  % ��ʱ����'

