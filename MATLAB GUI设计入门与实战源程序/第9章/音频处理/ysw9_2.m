% 语音话筒数据处理
clc,clear,close all
warning off
feature jit off
load myRecording.mat
% 时域分析
fs = 44100;   % 采样频率
mag = 1.05;
bit = 2;
RecordLength = 5;  % 录音时间 s
ShowLength = 5;    % 显示的时间长度 s
x1 = myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end);
N=length(x1);              %设置短时傅里叶变换的长度，同时也是汉明窗的长度
x2 = x1-mean(x1); % 零均值化
figure(1),plot(x2);
title('零均值化')
x3 = smooth(x2);  % 平滑滤波
figure(2),plot(x3);
title('平滑滤波处理')

%% 频域分析
x4=abs(fft(x3));     % 进行fft变换
figure(3),
plot(x4(1:floor(length(x3)/2)),'b-','linewidth',2)
axis tight
title('幅频特性曲线')












