% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
format short
tic  % �����ʱ
fun='x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2)';     %Ŀ�꺯��
x0=[0 1];   % ��ֵ
A=[-2 3];   % ���Բ���ʽԼ��
b=6;        % ���Բ���ʽԼ��
Aeq=[ ];    % �����Ե�ʽԼ��
beq=[ ];    % �����Ե�ʽԼ��
lb=[ ];     % xû���½�
ub=[ ];     % xû���Ͻ�
[x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,@non_constraint)
toc  % ��ʱ����'
