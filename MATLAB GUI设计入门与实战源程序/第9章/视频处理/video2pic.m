function ysw=video2pic( videoFile, outputPath, picFormat, length )
%% ��ʼ�����������û������
if nargin < 1
    videoFile = input('������Ƶ·��:', 's');
    outputPath = input('�����Ƶ·��:', 's');
    if isempty(outputPath)
        outputPath = videoFile(1, 1:find(videoFile=='\', 1, 'last')-1);
    end
    picFormat = input('���ͼ���ʽ��Ĭ��Ϊjpg:');
    if isempty(picFormat)
        picFormat = 'JPG';
    end
end

%% ���������
videoObject = VideoReader(videoFile);
numFrames = get(videoObject, 'numberOfFrames');
fileName = get(videoObject, 'Name');

numOrder = max(4, size(int2str(numFrames), 2));
mkdir(outputPath);

indexFrame = [1 1];
frameLimit = 100; % �û��Լ��趨���ָ�֡ͼ������
j=0;
while indexFrame(1, 1) <= numFrames

    indexFrame(1, 2) = min(numFrames, indexFrame(1, 1) + frameLimit);
    frameAll = read(videoObject, indexFrame);  % ��ͼ��
    
    for i = indexFrame(1, 1):5:indexFrame(1, 2)    % ��֡ͼ�񱣴�Ϊjpgͼ��        
        imgFrame = frameAll(:,:,:,i - indexFrame(1, 1) + 1);
        saveFormat = strcat(int2str(((i+length)-4*j)),'.jpg');
        picName = sprintf(saveFormat, outputPath, fileName, ((i+length)-4*j), picFormat);
        imwrite( imgFrame, strcat(outputPath, picName),'jpg');
        disp(picName); % ��ʾ���֣�Ҳ���Բ���ʾ.
        j=j+1;
    end
    indexFrame(1, 1) = indexFrame(1, 2) + 1;
end

ysw=(i+length)-4*(j-1);

end


