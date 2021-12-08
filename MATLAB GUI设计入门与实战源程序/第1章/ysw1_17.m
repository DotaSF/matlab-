function ysw1_17
% From SWJTU University
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
t0=0;  % ʱ���ʼֵ
tf=20; % ʱ����ֵֹ
x0=[0,0.25]; % ��ʼֵ
[t,x]=ode45(@VDP,[t0 tf],x0);
figure(1),
plot(t,x(:,1),':b',t,x(:,2),'-r')
legend('�ٶ�','λ��')
figure(2),
plot(x(:,1),x(:,2),'linewidth',2);
xlabel('�ٶ�');ylabel('λ��')
toc  % ��ʱ����'
end

function xdot=VDP(t,x)
xdot=zeros(2,1); % ��ʼ������Ԫ������
xdot(1)=(1-x(2)^2)*x(1)-x(2);
xdot(2)=x(1);
% xdot=[(1-x(2)^2)*x(1)-x(2);x(1)];
end