function ysw1_6
% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
t_final=100;      % ��ֹʱ��
x0=[0;0;1e-10];   % ��ֵ
[t,x]=ode45(@lorenzeq,[0,t_final],x0);    % ��������� 
figure('color',[1,1,1]);                   % �Ƚ�ͼ�δ���
subplot(211),plot(t,x);                    % ���켣ͼ
subplot(212),plot3(x(:,1),x(:,2),x(:,3));  % 3D����ͼ
axis([10,42,-20,20,-20,25]);   % ��������ʾ��Χ����
colormap(jet)  % ��ɫ
shading interp % ����
end

function xdot=lorenzeq(t,x)
xdot=[-8/3*x(1)+x(2)*x(3);
    -10*x(2)+10*x(3);-x(1)*x(2)+28*x(2)-x(3)];
end




