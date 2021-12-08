clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
load('data.mat')  % 加载数据
scale = 10000;   % determines the level of rounding
maxpoints = 200; % 画图点数
N = 3000;  % 模拟"r" values的个数
a = 2.0;   % 起始值 of "r"
b = 4;     % 终止值 of "r"
rs = linspace(a,b,N); % "r" values线性划分
M = 500;  % 迭代次数
% 循环
for j = 1:length(rs)
    
    r=rs(j);      % 当前 "r"值
    x=zeros(M,1); % 初始化
    x(1) = 0.5;   % 初始值( 0-1)
    
    for i = 2:M   % 迭代
        x(i) = r*x(i-1)*(1-x(i-1));
    end
    % semi-stable值
    out{j} = unique(round(scale*x(end-maxpoints:end)));
end
% 重新排列
data = [];
for k = 1:length(rs)
    n = length(out{k});
    data = [data;  rs(k)*ones(n,1),out{k}];
end
figure, % 画图
h=plot(data(:,1),data(:,2)/scale,'k.');
%% 
figure(100), % 画图
h=plot(data(:,1),data(:,2)/scale,'k.');
%%
figure, % 画图
h=plot(data(:,1),data(:,2)/scale,'k.');
set(h,'markersize',1)
%%
figure, % 画图
h=plot(data(:,1),data(:,2)/scale,'k.');
set(gcf,'Color',[1,1,1])

%% 
figure, % 画图
h=plot(data(:,1),data(:,2)/scale,'k.');
set(h,'Color',[0,1,0])














