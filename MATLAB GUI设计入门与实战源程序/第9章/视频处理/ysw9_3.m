% ������Ƶ
clc,clear,close all
warning off 
feature jit off
vid = videoinput('winvideo',1);
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
% ��ʼ��
im = getsnapshot(vid);  
% �����еĽ������Ϊһ����Ƶ
movie=avifile('ysw','compression','none','fps',15,'keyframe',2.1429,'quality',90);

for i=1:30
    im = getsnapshot(vid);
    imshow(im)
    % д����Ƶ
    movie=addframe(movie,uint8(im));
    drawnow; 
end








