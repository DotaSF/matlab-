% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format shortE
tic  % �����ʱ
x = linspace(2,4,200);       % ���Ա���ȡ��
y = Newton_fun_diff(x);      % �������ĺ���ֵ
plot(x,y,'linewidth',2);     % ���ƺ���y(x)����
hold on;
plot(xlim,[0,0],'m:');       % ������̶���
x0 = 3;                      % ��ʼ�����λ��
xj=Newton_dd('Newton_fun_diff',x0)    % ţ���������ʼ����3
digits(6),  % ���ݾ���
vpa(xj)     % ��ʾxj��
plot(xj,Newton_fun_diff(xj),'rs');    % ���ƽ��Ӧ�ĵ�
toc  % ��ʱ����'



