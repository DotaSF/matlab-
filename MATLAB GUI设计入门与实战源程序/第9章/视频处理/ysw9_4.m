% ��ȡ��Ƶ
clc,clear,close all
warning off 
feature jit off
videoObject = VideoReader('ysw.avi'); % ��ȡ��Ƶ
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');
for i=1:numFrames
    im = read(videoObject, i);
    imshow(im)
    drawnow;
end




