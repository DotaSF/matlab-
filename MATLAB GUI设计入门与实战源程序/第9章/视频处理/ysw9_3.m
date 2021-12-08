% 保存视频
clc,clear,close all
warning off 
feature jit off
vid = videoinput('winvideo',1);
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
% 初始化
im = getsnapshot(vid);  
% 将运行的结果保存为一个视频
movie=avifile('ysw','compression','none','fps',15,'keyframe',2.1429,'quality',90);

for i=1:30
    im = getsnapshot(vid);
    imshow(im)
    % 写入视频
    movie=addframe(movie,uint8(im));
    drawnow; 
end








