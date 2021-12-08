% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all   % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off        % 加速代码运行
format short        % 数据类型
imaqmem(7e08);   	% 申请内存空间
tic                 % 运算计时
% 将运行的结果保存为一个视频
movie=avifile('ysw','compression','none','fps',15,'keyframe',2.1429,'quality',90);

vid = videoinput('winvideo',1,'YUY2_320x240');  %摄像头参数
% 设置摄像头参数
set(vid, 'FramesPerTrigger', Inf);   		 % 帧触发器设置 
set(vid, 'ReturnedColorspace', 'rgb')       % RGB颜色空间
vid.FrameGrabInterval = 5;           	 % 帧数间隔
% 启动摄像头设备
start(vid)
% 采集100帧后，接触循环
while(vid.FramesAcquired<=100)
    data = getsnapshot(vid);  % 拍摄图像
    imshow(data)            % 画图
    
    movie=addframe(movie,uint8(data));
    drawnow; 
end
    
stop(vid);       	% 停止
flushdata(vid);  	% 清楚缓存数据
% 清楚所有的变量
clear all

toc                 % 计时结束
