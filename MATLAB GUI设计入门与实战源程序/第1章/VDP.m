function xdot=VDP(t,x)
xdot=zeros(2,1); % ��ʼ������Ԫ������
xdot(1)=(1-x(2)^2)*x(1)-x(2);
xdot(2)=x(1);
% xdot=[(1-x(2)^2)*x(1)-x(2);x(1)];
