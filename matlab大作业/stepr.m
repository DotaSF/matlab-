function[ess,tp,sigma,tr,ts] = stepr(g1,h,gc)
%��������һ�����������ô��
%������������Ǵ��ݺ������������������ݺ���
%�������ݺ�������+����
%�ҳ�ϵͳ��Ծ��Ӧ�ķ�ֵʱ�䡢����ʱ�䡢��ʱʱ�䡢����ʱ�䡢������
g = series(gc,g1);
sys = feedback(g,h);figure;
[y,t,x] = step(sys);%��Ծ��Ӧ
plot(t,y,'r-',t,1-y,'b--')
hold on  %��ͼ
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
        tp = t(i) %��ֵʱ��
        maxi = i;
        sigma = (y(maxi)-dcgain(sys))/(dcgain(sys)) %������
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
tr = t(j)-t(i)  %����ʱ��
for i=1:length(y) 
    if(y(i)-0.5*dcgain(sys)>=0)
        break; 
    end
end
td=t(i) % �ӳ�ʱ��
n=length(y);
while(n>0) 
    if(abs(y(n)-dcgain(sys))>0.02*dcgain(sys)) 
        n=n-1; 
        break; 
    else
        n=n-1; 
    end
end
ts=t(n+1) % %2 ����ʱ�� 
end
