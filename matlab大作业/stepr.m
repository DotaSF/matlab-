function[ess,tp,sigma,tr,ts] = stepr(g1,h,gc)
%我来解释一下这个函数怎么用
%输入参数依次是传递函数，反馈函数，传递函数
%两个传递函数串联+反馈
%找出系统阶跃响应的峰值时间、上升时间、延时时间、调节时间、超调量
g = series(gc,g1);
sys = feedback(g,h);figure;
[y,t,x] = step(sys);%阶跃响应
plot(t,y,'r-',t,1-y,'b--')
hold on  %绘图
legend('y(t)','e(t)');
title('step response');xlabel('time');ylabel('response');
hold off
ess = abs(dcgain(sys)-1)
if(ess>0)
    display(':The system has a stable error')
else display(':The system does not have  error')
end
maxi = 0;
for i=2:length(y)-1
    if(y(i)>=y(i-1)&&y(i)>=y(i+1))
        tp = t(i) %峰值时间
        maxi = i;
        sigma = (y(maxi)-dcgain(sys))/(dcgain(sys)) %超调量
        if(sigma>0.2|sigma<0)
            display(':The system has a big overshoot.')
        else display(':The system has a small overshoot.')
        end
        break;
    else maxi = [maxi 0];
    end
end
if(~any(maxi))
    tp = inf
    sigma = 0
    display(':The tp dosen`t exist and the sigma is zero .')
    display(':The systerm doesn`t have a overshoot.') 
end
for i = 1:length(y)
    if(y(i)-0.1*dcgain(sys)>=0)
        break;
    end
end
for j = i:length(y)
    if(y(j)-0.9*dcgain(sys)>=0)
        break;
    end
end
tr = t(j)-t(i)  %上升时间
for i=1:length(y) 
    if(y(i)-0.5*dcgain(sys)>=0)
        break; 
    end
end
td=t(i) % 延迟时间
n=length(y);
while(n>0) 
    if(abs(y(n)-dcgain(sys))>0.02*dcgain(sys)) 
        n=n-1; 
        break; 
    else
        n=n-1; 
    end
end
ts=t(n+1) % %2 调节时间 
end
