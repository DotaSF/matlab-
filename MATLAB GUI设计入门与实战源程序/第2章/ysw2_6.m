% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
myworld = vrworld('octavia_body.wrl')
open(myworld)
view(myworld)
toc  % ��ʱ����
%%
close(myworld)
%%
delete(myworld)
%%
vrclear
vrclear('-force')

