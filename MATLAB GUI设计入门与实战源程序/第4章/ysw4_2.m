clc,clear,close all % ���
warning off         % ȡ������
feature jit off     % ���ٴ���ִ��
load('data.mat')  % ��������
scale = 10000;   % determines the level of rounding
maxpoints = 200; % ��ͼ����
N = 3000;  % ģ��"r" values�ĸ���
a = 2.0;   % ��ʼֵ of "r"
b = 4;     % ��ֵֹ of "r"
rs = linspace(a,b,N); % "r" values���Ի���
M = 500;  % ��������
% ѭ��
for j = 1:length(rs)
    
    r=rs(j);      % ��ǰ "r"ֵ
    x=zeros(M,1); % ��ʼ��
    x(1) = 0.5;   % ��ʼֵ( 0-1)
    
    for i = 2:M   % ����
        x(i) = r*x(i-1)*(1-x(i-1));
    end
    % semi-stableֵ
    out{j} = unique(round(scale*x(end-maxpoints:end)));
end
% ��������
data = [];
for k = 1:length(rs)
    n = length(out{k});
    data = [data;  rs(k)*ones(n,1),out{k}];
end
figure, % ��ͼ
h=plot(data(:,1),data(:,2)/scale,'k.');
%% 
figure(100), % ��ͼ
h=plot(data(:,1),data(:,2)/scale,'k.');
%%
figure, % ��ͼ
h=plot(data(:,1),data(:,2)/scale,'k.');
set(h,'markersize',1)
%%
figure, % ��ͼ
h=plot(data(:,1),data(:,2)/scale,'k.');
set(gcf,'Color',[1,1,1])

%% 
figure, % ��ͼ
h=plot(data(:,1),data(:,2)/scale,'k.');
set(h,'Color',[0,1,0])














