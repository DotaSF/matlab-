% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8]';
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
mesh(x,y,Z)
xlabel('x'); ylabel('y'); zlabel('z')
toc  % ��ʱ����'

%% nearest
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % ��ֵ����
yi = min(y):(max(y)-min(y))/50:max(y);  % ��ֵ����
yi = yi'; % ת��
Zi = griddata(x,y,Z,xi,yi,'nearest');   % ��ֵ
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('nearest��ֵ')
toc  % ��ʱ����

%% linear
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % ��ֵ����
yi = min(y):(max(y)-min(y))/50:max(y);  % ��ֵ����
yi = yi'; % ת��
Zi = griddata(x,y,Z,xi,yi,'linear');   % ��ֵ
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('linear��ֵ')
toc  % ��ʱ����

%% cubic
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ�������
tic  % �����ʱ
x = [1:10];
y = [0, 0, 1, 1, 3, 4, 6, 7, 7, 8];
z = [8, 2, 8, 0, 3, 7, 8, 2, 4, 1];
Z = z'*ones(1,length(x));
figure('color',[1,1,1])
xi = min(x):(max(x)-min(x))/50:max(x);  % ��ֵ����
yi = min(y):(max(y)-min(y))/50:max(y);  % ��ֵ����
yi = yi'; % ת��
Zi = griddata(x,y,Z,xi,yi,'cubic');   % ��ֵ
mesh(xi,yi,Zi)
grid on
xlabel('x'); ylabel('y'); zlabel('z')  
title('spline��ֵ')
toc  % ��ʱ����

