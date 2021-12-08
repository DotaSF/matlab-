% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
%% nearest
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi,'nearest');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','nearest��ֵ')
toc  % ��ʱ����

%% linear
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi);
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','linear��ֵ')
toc  % ��ʱ����
%% spline
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi,'spline');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','spline��ֵ')
toc  % ��ʱ����
%% pchip
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi,'pchip');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','pchip��ֵ')
toc  % ��ʱ����

%% cubic
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi,'cubic');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','cubic��ֵ')
toc  % ��ʱ����

%% v5cubic
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [1, 1, 7, 4, 0, 6, 3, 0, 8, 7];
figure('color',[1,1,1])
hold on
plot(x,y,'o--','linewidth',2)  % ԭ��ͼ��
xi = 1:0.1:10;
yi = interp1(x,y,xi,'v5cubic');
hold on
grid on
plot(xi,yi,'r*--','linewidth',2)  % ԭ��ͼ��
xlabel('x');  ylabel('y');  
legend('ԭʼ����','v5cubic��ֵ')
toc  % ��ʱ����




