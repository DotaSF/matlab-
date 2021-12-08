%% 读取
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
imaqmem(7e08);   	% 申请内存空间
tic                 % 运算计时
load('ysw.mat')
plot(ysw)
grid on
% 清楚所有的变量
clear all
toc                      % 计时结束
%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
% 加载 a .wav 分拣
[x, fs] = wavread('track.wav');     % 获取采样率samples
x = x(:, 1);                        % 得到第一个通道
plot(x)
grid on

%% 采集
% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
imaqmem(7e08);   	% 申请内存空间
tic                 % 运算计时
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
while toc<.1
end
bit = 2;  % 2bit
% 声音源数据显示
h=figure('numbertitle','off','name','锤声音设别——ysw');
set(h,'color','g');
while toc<RecordLength
    
    myRecording = getaudiodata(recObj);  % 录音数据保存
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording)); % 幅值
    ylim([-1.2 1.2]*mag)         % y轴显示范围
    % x轴显示范围
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])

    drawnow   % 刷新
    idx_last = idx;
    
    ysw = myRecording;
end
save ysw.mat ysw
%%
% 声音源数据显示
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
imaqmem(7e08);   	% 申请内存空间
tic                 % 运算计时
h=figure('numbertitle','off','name','KTV内响锤声音设别——余胜威——西南交通大学');
set(h,'color','g');                          % 5秒的数据长度

for num_ysw = 1:4   % 重启4次录音设备
    clc,clear all %,close all
    aud = audiodevinfo;   % 声音设备
    % 初始化
    RecordLength = 20;    % 录音时间 s
    ShowLength = 5;       % 显示的时间长度 s
    fs = 44100;           % 采样频率
    nBits = 16;
    bit = 2;
    
    recObj = audiorecorder(fs,nBits,1);  % 录音设备
    record(recObj,RecordLength);         % 录音
    tic
    while toc<0.1
    end

    while toc<RecordLength

        myRecording = getaudiodata(recObj);
        % 声音信号图
        subplot(221),plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end),'linewidth',2 )
        mag = max(abs(myRecording));    % 幅值
        ylim([-1.2 1.2]*mag)
        xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])
        xlabel('Time(s)');ylabel('Magnitude');box off
        % 谱图
        subplot(222),x1 = myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end);  % 截取分析数据
        X=stfth(x1',256);  % STFT短时傅里叶变换
        spectrogram(x1,2^9/(2^bit),2^7/(2^bit),2^12/(2^bit),fs/(2^bit))
        view(90,-90); 
        xlim([0 3000]);  ylim([0 ShowLength]);
        xlabel('Frequency, Hz');
        % 响锤音检测
        subplot(223), plot( sum(abs(X')),'linewidth',5 )
        axis xy;axis tight;box off
        xlabel('Time(s)'); ylabel('Energy')
        
        thre = 100;
        for i = 1: size(X,1)
            if sum(abs(X(i,:)))>thre
                fea_thre(i)=1;
            else
                fea_thre(i)=0;
            end
        end
        subplot(224), plot( fea_thre,'linewidth',5 )
        axis xy;axis tight;box off
        xlabel('Time(s)'); ylabel('Energy')
        
        drawnow
    end
    
    delete(recObj);                   % 删除录音设备
    drawnow

end

% 录音声音 重放
% sound(myRecording, fs);
%%
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
imaqmem(7e08);   	% 申请内存空间
tic                 % 运算计时
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
while toc<.1
end
bit = 2;  % 2bit
% 声音源数据显示
h=figure('numbertitle','off','name','锤声音设别——ysw');
set(h,'color','g');
while toc<RecordLength
    
    myRecording = getaudiodata(recObj);  % 录音数据保存
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording)); % 幅值
    ylim([-1.2 1.2]*mag)         % y轴显示范围
    % x轴显示范围
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])

    drawnow   % 刷新
    idx_last = idx;
    ysw = myRecording;
end
save ysw.mat ysw
% 录音声音 重放
sound(ysw, fs);

wavwrite(ysw,'ysw.wav')

% 清楚所有的变量
clear all

toc                      % 计时结束

