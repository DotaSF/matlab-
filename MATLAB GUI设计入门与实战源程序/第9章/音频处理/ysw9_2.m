% ������Ͳ���ݴ���
clc,clear,close all
warning off
feature jit off
load myRecording.mat
% ʱ�����
fs = 44100;   % ����Ƶ��
mag = 1.05;
bit = 2;
RecordLength = 5;  % ¼��ʱ�� s
ShowLength = 5;    % ��ʾ��ʱ�䳤�� s
x1 = myRecording(max(1,size(myRecording,1)-fs*ShowLength):(2^bit):end);
N=length(x1);              %���ö�ʱ����Ҷ�任�ĳ��ȣ�ͬʱҲ�Ǻ������ĳ���
x2 = x1-mean(x1); % ���ֵ��
figure(1),plot(x2);
title('���ֵ��')
x3 = smooth(x2);  % ƽ���˲�
figure(2),plot(x3);
title('ƽ���˲�����')

%% Ƶ�����
x4=abs(fft(x3));     % ����fft�任
figure(3),
plot(x4(1:floor(length(x3)/2)),'b-','linewidth',2)
axis tight
title('��Ƶ��������')












