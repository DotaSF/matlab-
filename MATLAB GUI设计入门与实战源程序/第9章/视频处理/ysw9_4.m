% 读取视频
clc,clear,close all
warning off 
feature jit off
videoObject = VideoReader('ysw.avi'); % 读取视频
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');
for i=1:numFrames
    im = read(videoObject, i);
    imshow(im)
    drawnow;
end




