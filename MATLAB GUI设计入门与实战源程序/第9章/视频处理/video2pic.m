function ysw=video2pic( videoFile, outputPath, picFormat, length )
%% 初始化操作，如果没有输入
if nargin < 1
    videoFile = input('输入视频路径:', 's');
    outputPath = input('输出视频路径:', 's');
    if isempty(outputPath)
        outputPath = videoFile(1, 1:find(videoFile=='\', 1, 'last')-1);
    end
    picFormat = input('输出图像格式，默认为jpg:');
    if isempty(picFormat)
        picFormat = 'JPG';
    end
end

%% 主程序设计
videoObject = VideoReader(videoFile);
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');

numOrder = max(4, size(int2str(numFrames), 2));
mkdir(outputPath);

indexFrame = [1 1];
frameLimit = 100; % 用户自己设定，分割帧图像数量
j=0;
while indexFrame(1, 1) <= numFrames

    indexFrame(1, 2) = min(numFrames, indexFrame(1, 1) + frameLimit);
    frameAll = read(videoObject, indexFrame);  % 读图像
    
    for i = indexFrame(1, 1):5:indexFrame(1, 2)    % 将帧图像保存为jpg图像        
        imgFrame = frameAll(:,:,:,i - indexFrame(1, 1) + 1);
        saveFormat = strcat(int2str(((i+length)-4*j)),'.jpg');
        picName = sprintf(saveFormat, outputPath, fileName, ((i+length)-4*j), picFormat);
        imwrite( imgFrame, strcat(outputPath, picName),'jpg');
        disp(picName); % 显示名字，也可以不显示.
        j=j+1;
    end
    indexFrame(1, 1) = indexFrame(1, 2) + 1;
end

ysw=(i+length)-4*(j-1);

end


