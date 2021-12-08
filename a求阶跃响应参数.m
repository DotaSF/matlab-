%Matlab作单位阶跃响应曲线的三维图
%标准二阶系统响应曲线 wn=1
t=0:0.2:10;
zeta=[0 0.2 0.4 0.6 0.8 1];
for n=1:6
num=1;
den=[1 2*zeta(n) 1];
[y(1:51,n),x,t]=step(num,den,t) ;
end


plot(t,y)


mesh(t,zeta,y')

%求上升时间、峰值时间、最大过调量和调整时间
%可以应用到高阶系统
num=[0 0 25];
den=[1 6 25];
t=0:0.005:5;
[y,x,t]=step(num,den,t) ;
r=1;
while y(r)<1.0001;r=r+1;end;
rise_time=(r-1)*0.005


[ymax,tp]=max(y);
peak_time=(tp-1)*0.005


max_overshoot=ymax-1


s=1001;while y(s)>0.98&y(s)<1.02;s=s-1;end;
settle_time=(s-1)*0.005