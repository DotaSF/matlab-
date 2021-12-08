function ysw=video2pic( videoFile, outputPath, picFormat, length )
%% Initialization
if nargin < 1
    videoFile = input('Input full video path:', 's');
    outputPath = input('Input video output path[Default is under the video path]:', 's');
    if isempty(outputPath)
        outputPath = videoFile(1, 1:find(videoFile=='\', 1, 'last')-1);
    end
    picFormat = input('Input output pic format[JPG by default]:');
    if isempty(picFormat)
        picFormat = 'JPG';
    end
end

%% Main part
videoObject = VideoReader(videoFile);
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');

numOrder = max(4, size(int2str(numFrames), 2));
mkdir(outputPath);

indexFrame = [1 1];
frameLimit = 100; % This can be set a larger value with enough memory.
j=0;
while indexFrame(1, 1) <= numFrames

    indexFrame(1, 2) = min(numFrames, indexFrame(1, 1) + frameLimit);
    frameAll = read(videoObject, indexFrame);
    
    for i = indexFrame(1, 1):5:indexFrame(1, 2)    %save frames to pic        
        imgFrame = frameAll(:,:,:,i - indexFrame(1, 1) + 1);
        saveFormat = strcat(int2str(((i+length)-4*j)),'.jpg');
        picName = sprintf(saveFormat, outputPath, fileName, ((i+length)-4*j), picFormat);
        imwrite( imgFrame, strcat(outputPath, picName),'jpg');
        disp(picName); % This output can be turned off.
        j=j+1;
    end
    indexFrame(1, 1) = indexFrame(1, 2) + 1;
end

ysw=(i+length)-4*(j-1);

end


