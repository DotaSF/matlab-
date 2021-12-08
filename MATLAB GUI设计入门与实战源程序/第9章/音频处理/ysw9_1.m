% ������Ͳ���ݶ�ȡ
clc,clear,close all
warning off
aud = audiodevinfo;   % �����豸
% ��ʼ��
RecordLength = 5;  % ¼��ʱ�� s
ShowLength = 5;    % ��ʾ��ʱ�䳤�� s
FrequencyWindow1 = 0;
FrequencyWindow2 = 3000;
fs = 44100;   % ����Ƶ��
nBits = 16;
mag = 1.05;
idx_last = 1;
recObj = audiorecorder(fs,nBits,1);  % ¼���豸
record(recObj,RecordLength);         % ¼��
tic
while toc<.1
end
bit = 2;

% ����Դ������ʾ
h=figure('numbertitle','off','name','�����ɼ�������ʤ������SWJTU');
set(h,'color','g');

while toc<RecordLength
    
    myRecording = getaudiodata(recObj);
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    subplot(211),plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording));
    ylim([-1.2 1.2]*mag)
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])

    subplot(212),spectrogram(myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end),2^9/(2^bit),2^7/(2^bit),2^12/(2^bit),fs/(2^bit))
    xlim([FrequencyWindow1 FrequencyWindow2])
    ylim([0 ShowLength])
    view(-90,90) 
    set(gca,'ydir','reverse')       
    set(gca, 'YTick', []);

    drawnow
    idx_last = idx;
    
end

% ¼������ �ط�
save myRecording.mat myRecording
load myRecording.mat
% sound(myRecording, fs);







