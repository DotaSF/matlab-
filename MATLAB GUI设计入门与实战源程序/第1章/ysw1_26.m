% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
P=rand(10000,2);
x=2*P(:,1)-1;
y=2*P(:,2);
points=find(y<=2-x.^2&y.^3>=x.^2);
M=length(points);
S=4*M/10000
figure('color',[1,1,1])
plot(x(points),y(points),'bs')
toc  % ��ʱ����'


