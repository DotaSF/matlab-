% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
x = 1:0.1:10;
y = x.^2 + max(x)*sin(x);
plot(x,y)
grid on
grid off

%% ���������
% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
[x,y] = meshgrid([1:0.1:10],[1:0.1:10]);
z = x.^2+y.^3.*sin(x);   % Z
figure('color',[1,1,1]) 
surf(x,y,z)              % ����
xlabel('x');ylabel('y');zlabel('z');

figure('color',[1,1,1]) 
mesh(x,y,z)              % ����
xlabel('x');ylabel('y');zlabel('z');
colormap(jet)  % ��ɫ
shading interp % ����






