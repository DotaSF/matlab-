%Matlab����λ��Ծ��Ӧ���ߵ���άͼ
%��׼����ϵͳ��Ӧ���� wn=1
t=0:0.2:10;
zeta=[0 0.2 0.4 0.6 0.8 1];
for n=1:6
num=1;
den=[1 2*zeta(n) 1];
[y(1:51,n),x,t]=step(num,den,t) ;
end


plot(t,y)


mesh(t,zeta,y')

%������ʱ�䡢��ֵʱ�䡢���������͵���ʱ��
%����Ӧ�õ��߽�ϵͳ
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