% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x = 0:0.05:10;    % 0.05,0.1,0.15,0.2,����,10
y = tan(x);       % ֱ�߷���
plot(x,y,'r.-')   % ��ͼ
grid on; xlabel('x'); ylabel('y')

%% ����
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x = 1:5:100;   % 1,6,11,16,����,96
y1 = 1*x;         % ֱ�߷���
y2 = 2*x;         % ֱ�߷���
y3 = 3*x;         % ֱ�߷���
y4 = 4*x;         % ֱ�߷���
y5 = 5*x;         % ֱ�߷���
y6 = 6*x;         % ֱ�߷���
y7 = 7*x;         % ֱ�߷���
y8 = 8*x;         % ֱ�߷���
y9 = 9*x;         % ֱ�߷���
y10 = 10*x;         % ֱ�߷���
figure('color',[1,1,1]);                   % �Ƚ�ͼ�δ���
hold on
plot(x,y1,'-')  % ��ͼ
plot(x,y2,'--')  % ��ͼ
plot(x,y3,'.-')  % ��ͼ
plot(x,y4,'*-')  % ��ͼ
plot(x,y5,'s-')  % ��ͼ
plot(x,y6,'p-')  % ��ͼ
plot(x,y7,'>-')  % ��ͼ
plot(x,y8,'<-')  % ��ͼ
plot(x,y9,'h-')  % ��ͼ
plot(x,y10,'o-')  % ��ͼ
grid on; xlabel('x'); ylabel('y')
haxes2=axes('position',[0.2,0.6,0.3,0.3]);
axis(haxes2);
hold on
plot(x(5:6),y1(5:6),'-')  % ��ͼ
plot(x(5:6),y2(5:6),'--')  % ��ͼ
plot(x(5:6),y3(5:6),'.-')  % ��ͼ
plot(x(5:6),y4(5:6),'*-')  % ��ͼ
plot(x(5:6),y5(5:6),'s-')  % ��ͼ
plot(x(5:6),y6(5:6),'p-')  % ��ͼ
plot(x(5:6),y7(5:6),'>-')  % ��ͼ
plot(x(5:6),y8(5:6),'<-')  % ��ͼ
plot(x(5:6),y9(5:6),'h-')  % ��ͼ
plot(x(5:6),y10(5:6),'o-')  % ��ͼ

%% ��ɫ
figure('color',[1,1,1]);                   % �Ƚ�ͼ�δ���
hold on
plot(x,y1,'r-')  % ��ͼ
plot(x,y2,'g--')  % ��ͼ
plot(x,y3,'b.-')  % ��ͼ
plot(x,y4,'k*-')  % ��ͼ
plot(x,y5,'cs-')  % ��ͼ
plot(x,y6,'mp-')  % ��ͼ
plot(x,y7,'w>-')  % ��ͼ
plot(x,y8,'y<-')  % ��ͼ
grid on; xlabel('x'); ylabel('y')
haxes2=axes('position',[0.2,0.6,0.3,0.3]);
axis(haxes2);
hold on
plot(x(5:6),y1(5:6),'r-','linewidth',2)  % ��ͼ
plot(x(5:6),y2(5:6),'g--','linewidth',2)  % ��ͼ
plot(x(5:6),y3(5:6),'b.-','linewidth',2)  % ��ͼ
plot(x(5:6),y4(5:6),'k*-','linewidth',2)  % ��ͼ
plot(x(5:6),y5(5:6),'cs-','linewidth',2)  % ��ͼ
plot(x(5:6),y6(5:6),'mp-','linewidth',2)  % ��ͼ
plot(x(5:6),y7(5:6),'w>-','linewidth',2)  % ��ͼ
plot(x(5:6),y8(5:6),'y<-','linewidth',2)  % ��ͼ

