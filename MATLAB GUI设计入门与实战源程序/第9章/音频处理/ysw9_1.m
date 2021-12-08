% 语音话筒数据读取
clc,clear,close all
warning off
aud = audiodevinfo;   % 声音设备
% 初始化
RecordLength = 5;  % 录音时间 s
ShowLength = 5;    % 显示的时间长度 s
FrequencyWindow1 = 0;
FrequencyWindow2 = 3000;
fs = 44100;   % 采样频率
nBits = 16;
mag = 1.05;
idx_last = 1;
recObj = audiorecorder(fs,nBits,1);  % 录音设备
record(recObj,RecordLength);         % 录音
tic
while toc<.1
end
bit = 2;

% 声音源数据显示
h=figure('numbertitle','off','name','声音采集——余胜威——SWJTU');
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

% 录音声音 重放
save myRecording.mat myRecording
load myRecording.mat
% sound(myRecording, fs);







