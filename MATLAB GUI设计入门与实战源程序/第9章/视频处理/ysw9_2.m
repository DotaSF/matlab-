clc,clear,close all
warning off 
feature jit off
webcam = imaq.VideoDevice('winvideo');
vid = videoinput('winvideo',1);
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
vidRes = get(vid, 'VideoResolution');
nBands = get(vid, 'NumberOfBands');
preview(vid)
closepreview(vid)
%% ×¥ÅÄÍ¼Ïñ
clc,clear,close all
warning off 
feature jit off
webcam = imaq.VideoDevice('winvideo');
vid = videoinput('winvideo',1);
set(vid,'TriggerRepeat',Inf);
set(vid,'FramesPerTrigger',1);
set(vid,'FrameGrabInterval',1);
vidRes = get(vid, 'VideoResolution');
nBands = get(vid, 'NumberOfBands');

pic1 = getsnapshot(vid);
imshow(pic1);

pic11 = rgb2ycbcr(pic1);
imshow(pic11);

pic11 = rgb2hsv(pic1);
imshow(pic11);

% data = rgb2ycbcr(getsnapshot(vid));
% imshow(data)















