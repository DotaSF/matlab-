% Designed by Yu Shengwei From SWJTU University
% 2014��12��29��
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off       % ��������
feature jit off      % ���ٴ������� 
ysw.y1{1} = [1,2];
ysw.y2{1} = [3,2];
disp(ysw)  % ��ʾ�ṹ��

for i =1:2
    ysw.y3{i} = i;
    if i==2
        ysw.y = i^2; 
    end
end
disp(ysw)  % ��ʾ�ṹ��
