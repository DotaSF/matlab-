% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
%构建网络
nntwarn off
P = [1,1,7,4,0,6,3,0,8,7;
    1,3,6,7,9,6,1,0,0,4];
T = [1,8,2,8,0,3,7,8,2,4];
%  创建一个新的前向神经网络  
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm');
%  当前输入层权值和阈值 
inputWeights=net_1.IW{1,1} ;
inputbias=net_1.b{1} ;
%  当前网络层权值和阈值 
layerWeights=net_1.LW{2,1} ;
layerbias=net_1.b{2} ;
%  设置训练参数
net_1.trainParam.show = 50; 
net_1.trainParam.lr = 0.05; 
net_1.trainParam.mc = 0.9; 
net_1.trainParam.epochs = 10000; 
net_1.trainParam.goal = 1e-3; 
%  调用 TRAINGDM 算法训练 BP 网络
[net_1,tr]=train(net_1,P,T); 
%  对 BP 网络进行仿真
A = sim(net_1,P); 
%  计算仿真误差  
E = T - A;   % 误差
MSE=mse(E)   % 均方差

x=[1,3,6,7,9,6,1,0,0,4;
    1,8,2,4,5,7,8,9,0,1];
sim(net_1,x)'   % 预测结果
toc  % 计时结束

%%
net_1.trainParam.showWindow = 0; 

%%
% Designed by Yu Shengwei From SWJTU University
% 2015年2月3日
clc,clear,close all % 清理命令区、清理工作区、关闭显示图形
warning off         % 消除警告
feature jit off     % 加速代码运行
format short        % 数据类型
tic                 % 运算计时
%构建网络
nntwarn off
P = [1,1,7,4,0,6,3,0,8,7;
    1,3,6,7,9,6,1,0,0,4];
T = [1,8,2,8,0,3,7,8,2,4];
%  创建一个新的前向神经网络  
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm');
%  当前输入层权值和阈值 
inputWeights=net_1.IW{1,1} ;
inputbias=net_1.b{1} ;
%  当前网络层权值和阈值 
layerWeights=net_1.LW{2,1} ;
layerbias=net_1.b{2} ;
%  设置训练参数
net_1.trainParam.show = 50; 
net_1.trainParam.lr = 0.05; 
net_1.trainParam.mc = 0.9; 
net_1.trainParam.epochs = 10000; 
net_1.trainParam.goal = 1e-3; 
net_1.trainParam.showWindow = 0; 
%  调用 TRAINGDM 算法训练 BP 网络
[net_1,tr]=train(net_1,P,T); 
%  对 BP 网络进行仿真
A = sim(net_1,P); 
%  计算仿真误差  
E = T - A;   % 误差
MSE=mse(E)   % 均方差

x=[1,3,6,7,9,6,1,0,0,4;
    1,8,2,4,5,7,8,9,0,1];
sim(net_1,x)'   % 预测结果
toc  % 计时结束

