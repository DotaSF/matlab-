% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 

y = @(s,w)s+w ;  % �ӷ�����
y1 = y(1,2)
y2 = y(117,4063087)
y3 = y(182803,78241)

for i =1:10
    ysw(i) = y(i^2,2*i+1);  % �ӷ�����
end
plot(ysw,'linewidth',2)
grid on
haxes2=axes('position',[0.3,0.5,0.3,0.3]);
axis(haxes2);
plot(ysw,'ro--');

