% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = -5:1:5;      % x
y = 1./(1+x.*x); % y
% ��ȷ������
xj = -5:0.1:5;       % ����ֵ��x
yj = 1./(1+xj.*xj);  % ��ȷ��
plot(xj,yj,'linewidth',2) % ��ͼ
hold on                   % ͼ�α��־��
% �ߴζ���ʽ��ֵ
for i = 1:length(xj)
    disp([strcat('��ǰ��ֵ����Ϊ  ',num2str(i)),   strcat('�ܲ�ֵ����Ϊ  ',num2str(length(xj)))])
    yc(i) = Newton_interp(x,y,xj(i));
end
plot(xj,yc,'r--','linewidth',2)
grid on;xlabel('x'),ylabel('y')
legend('ԭ��������','ţ�ٲ�ֵ����')
toc  % ��ʱ����'

