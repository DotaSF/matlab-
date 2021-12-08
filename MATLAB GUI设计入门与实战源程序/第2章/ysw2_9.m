%% ��ȡ
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
imaqmem(7e08);   	% �����ڴ�ռ�
tic                 % �����ʱ
load('ysw.mat')
plot(ysw)
grid on
% ������еı���
clear all
toc                      % ��ʱ����
%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
% ���� a .wav �ּ�
[x, fs] = wavread('track.wav');     % ��ȡ������samples
x = x(:, 1);                        % �õ���һ��ͨ��
plot(x)
grid on

%% �ɼ�
% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
imaqmem(7e08);   	% �����ڴ�ռ�
tic                 % �����ʱ
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
while toc<.1
end
bit = 2;  % 2bit
% ����Դ������ʾ
h=figure('numbertitle','off','name','��������𡪡�ysw');
set(h,'color','g');
while toc<RecordLength
    
    myRecording = getaudiodata(recObj);  % ¼�����ݱ���
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording)); % ��ֵ
    ylim([-1.2 1.2]*mag)         % y����ʾ��Χ
    % x����ʾ��Χ
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])

    drawnow   % ˢ��
    idx_last = idx;
    
    ysw = myRecording;
end
save ysw.mat ysw
%%
% ����Դ������ʾ
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
imaqmem(7e08);   	% �����ڴ�ռ�
tic                 % �����ʱ
h=figure('numbertitle','off','name','KTV���촸������𡪡���ʤ���������Ͻ�ͨ��ѧ');
set(h,'color','g');                          % 5������ݳ���

for num_ysw = 1:4   % ����4��¼���豸
    clc,clear all %,close all
    aud = audiodevinfo;   % �����豸
    % ��ʼ��
    RecordLength = 20;    % ¼��ʱ�� s
    ShowLength = 5;       % ��ʾ��ʱ�䳤�� s
    fs = 44100;           % ����Ƶ��
    nBits = 16;
    bit = 2;
    
    recObj = audiorecorder(fs,nBits,1);  % ¼���豸
    record(recObj,RecordLength);         % ¼��
    tic
    while toc<0.1
    end

    while toc<RecordLength

        myRecording = getaudiodata(recObj);
        % �����ź�ͼ
        subplot(221),plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end),'linewidth',2 )
        mag = max(abs(myRecording));    % ��ֵ
        ylim([-1.2 1.2]*mag)
        xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])
        xlabel('Time(s)');ylabel('Magnitude');box off
        % ��ͼ
        subplot(222),x1 = myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end);  % ��ȡ��������
        X=stfth(x1',256);  % STFT��ʱ����Ҷ�任
        spectrogram(x1,2^9/(2^bit),2^7/(2^bit),2^12/(2^bit),fs/(2^bit))
        view(90,-90); 
        xlim([0 3000]);  ylim([0 ShowLength]);
        xlabel('Frequency, Hz');
        % �촸�����
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
    
    delete(recObj);                   % ɾ��¼���豸
    drawnow

end

% ¼������ �ط�
% sound(myRecording, fs);
%%
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
imaqmem(7e08);   	% �����ڴ�ռ�
tic                 % �����ʱ
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
while toc<.1
end
bit = 2;  % 2bit
% ����Դ������ʾ
h=figure('numbertitle','off','name','��������𡪡�ysw');
set(h,'color','g');
while toc<RecordLength
    
    myRecording = getaudiodata(recObj);  % ¼�����ݱ���
    idx = round(toc*fs);
    while idx-idx_last<.1*fs
        idx = round(toc*fs);
    end

    plot((max(1,size(myRecording,1)-fs*ShowLength):(2^bit):size(myRecording,1))./fs,myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end))
    mag = max(abs(myRecording)); % ��ֵ
    ylim([-1.2 1.2]*mag)         % y����ʾ��Χ
    % x����ʾ��Χ
    xlim([max(0,size(myRecording,1)/fs-ShowLength) max(size(myRecording,1)/fs,ShowLength)])

    drawnow   % ˢ��
    idx_last = idx;
    ysw = myRecording;
end
save ysw.mat ysw
% ¼������ �ط�
sound(ysw, fs);

wavwrite(ysw,'ysw.wav')

% ������еı���
clear all

toc                      % ��ʱ����

