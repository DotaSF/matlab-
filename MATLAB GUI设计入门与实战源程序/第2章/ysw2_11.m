% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all   % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off        % ���ٴ�������
format short        % ��������
imaqmem(7e08);   	% �����ڴ�ռ�
tic                 % �����ʱ
% �����еĽ������Ϊһ����Ƶ
movie=avifile('ysw','compression','none','fps',15,'keyframe',2.1429,'quality',90);

vid = videoinput('winvideo',1,'YUY2_320x240');  %����ͷ����
% ��������ͷ����
set(vid, 'FramesPerTrigger', Inf);   		 % ֡���������� 
set(vid, 'ReturnedColorspace', 'rgb')       % RGB��ɫ�ռ�
vid.FrameGrabInterval = 5;           	 % ֡�����
% ��������ͷ�豸
start(vid)
% �ɼ�100֡�󣬽Ӵ�ѭ��
while(vid.FramesAcquired<=100)
    data = getsnapshot(vid);  % ����ͼ��
    imshow(data)            % ��ͼ
    
    movie=addframe(movie,uint8(data));
    drawnow; 
end
    
stop(vid);       	% ֹͣ
flushdata(vid);  	% �����������
% ������еı���
clear all

toc                 % ��ʱ����
