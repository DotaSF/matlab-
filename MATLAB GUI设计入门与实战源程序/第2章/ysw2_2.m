% Designed by Yu Shengwei From SWJTU University
% 2015��1��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
A = [1,1,7,4,0,6,3,0,8,7;
    1,8,2,8,0,3,7,8,2,4;
    1,3,6,7,9,6,1,0,0,4;
    1,8,3,8,2,4,5,8,0,7];
A=[1];
%�洢����A
save ysw.txt A -ascii;

toc  % ��ʱ����

%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
format short        % ��������
tic                 % �����ʱ
A = [1,1,7,4,0,6,3,0,8,7;
    1,8,2,8,0,3,7,8,2,4;
    1,3,6,7,9,6,1,0,0,4;
    1,8,3,8,2,4,5,8,0,7];
B=[1];
%�洢����A
save ysw.txt A -ascii;
%׷�Ӵ洢���� N
save ysw.txt B -append -ascii;
toc  % ��ʱ����

%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
format short        % ��������
tic                 % �����ʱ
syms y s w
A = [1,8,2,8,0,3,7,8,2,4,1;
    1,3,6,7,9,6,1,0,0,4,1;
    1,8,3,8,2,4,5,8,0,7,4];
%�洢����A
save ysw.txt y %-ascii;
%׷�Ӵ洢���� N
save ysw.txt A -append -ascii;
toc  % ��ʱ����

