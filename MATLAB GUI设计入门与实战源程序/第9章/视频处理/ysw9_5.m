%% ysw.avi
clc,clear,close all  % �����������������������ر���ʾͼ��
warning off          % ��������
feature jit off      % ���ٴ�������
imaqmem(7e08);       % �����ڴ�ռ�
spname = '.';        % ��ȡ��Ƶ·��
savename = '.\ysw';  % ��ȡ��Ƶ֡ͼ�񱣴�·��
l=video2pic(strcat(spname,'\ysw.avi'),strcat(savename,'\'),'jpg',0); % ��Ƶ��֡��

