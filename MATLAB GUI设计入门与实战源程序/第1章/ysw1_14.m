% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
figure('color',[1,1,1])
plot(x,y,'bo-')   % ԭʼ����
hold on
p = polyfit(x,y,7); % 7�ζ���ʽ
yc = p(1)*x.^7 + p(2)*x.^6+ p(3)*x.^5 + p(4)*x.^4 + p(5)*x.^3 + p(6)*x.^2 +...
    p(7)*x.^1 + p(8)*x.^0;
plot(x,yc,'r*-')   % ԭʼ����
legend('ԭʼ����','�������')
xlabel('x');ylabel('y')






