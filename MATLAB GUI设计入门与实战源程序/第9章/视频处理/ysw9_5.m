%% ysw.avi
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off          % 消除警告
feature jit off      % 加速代码运行
imaqmem(7e08);       % 申请内存空间
spname = '.';        % 获取视频路径
savename = '.\ysw';  % 获取视频帧图像保存路径
l=video2pic(strcat(spname,'\ysw.avi'),strcat(savename,'\'),'jpg',0); % 视频总帧数

