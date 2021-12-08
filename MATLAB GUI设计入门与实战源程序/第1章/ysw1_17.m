function ysw1_17
% From SWJTU University
warning off       % 消除警告
feature jit off      % 加速代码运行
tic  % 运算计时
t0=0;  % 时间初始值
tf=20; % 时间终止值
x0=[0,0.25]; % 初始值
[t,x]=ode45(@VDP,[t0 tf],x0);
figure(1),
plot(t,x(:,1),':b',t,x(:,2),'-r')
legend('速度','位移')
figure(2),
plot(x(:,1),x(:,2),'linewidth',2);
xlabel('速度');ylabel('位移')
toc  % 计时结束'
end

function xdot=VDP(t,x)
xdot=zeros(2,1); % 初始化，二元零向量
xdot(1)=(1-x(2)^2)*x(1)-x(2);
xdot(2)=x(1);
% xdot=[(1-x(2)^2)*x(1)-x(2);x(1)];
end