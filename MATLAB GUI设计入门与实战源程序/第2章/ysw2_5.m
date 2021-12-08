% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
%��������
nntwarn off
P = [1,1,7,4,0,6,3,0,8,7;
    1,3,6,7,9,6,1,0,0,4];
T = [1,8,2,8,0,3,7,8,2,4];
%  ����һ���µ�ǰ��������  
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm');
%  ��ǰ�����Ȩֵ����ֵ 
inputWeights=net_1.IW{1,1} ;
inputbias=net_1.b{1} ;
%  ��ǰ�����Ȩֵ����ֵ 
layerWeights=net_1.LW{2,1} ;
layerbias=net_1.b{2} ;
%  ����ѵ������
net_1.trainParam.show = 50; 
net_1.trainParam.lr = 0.05; 
net_1.trainParam.mc = 0.9; 
net_1.trainParam.epochs = 10000; 
net_1.trainParam.goal = 1e-3; 
%  ���� TRAINGDM �㷨ѵ�� BP ����
[net_1,tr]=train(net_1,P,T); 
%  �� BP ������з���
A = sim(net_1,P); 
%  ����������  
E = T - A;   % ���
MSE=mse(E)   % ������

x=[1,3,6,7,9,6,1,0,0,4;
    1,8,2,4,5,7,8,9,0,1];
sim(net_1,x)'   % Ԥ����
toc  % ��ʱ����

%%
net_1.trainParam.showWindow = 0; 

%%
% Designed by Yu Shengwei From SWJTU University
% 2015��2��3��
clc,clear,close all % �����������������������ر���ʾͼ��
warning off         % ��������
feature jit off     % ���ٴ�������
format short        % ��������
tic                 % �����ʱ
%��������
nntwarn off
P = [1,1,7,4,0,6,3,0,8,7;
    1,3,6,7,9,6,1,0,0,4];
T = [1,8,2,8,0,3,7,8,2,4];
%  ����һ���µ�ǰ��������  
net_1=newff(minmax(P),[10,1],{'tansig','purelin'},'traingdm');
%  ��ǰ�����Ȩֵ����ֵ 
inputWeights=net_1.IW{1,1} ;
inputbias=net_1.b{1} ;
%  ��ǰ�����Ȩֵ����ֵ 
layerWeights=net_1.LW{2,1} ;
layerbias=net_1.b{2} ;
%  ����ѵ������
net_1.trainParam.show = 50; 
net_1.trainParam.lr = 0.05; 
net_1.trainParam.mc = 0.9; 
net_1.trainParam.epochs = 10000; 
net_1.trainParam.goal = 1e-3; 
net_1.trainParam.showWindow = 0; 
%  ���� TRAINGDM �㷨ѵ�� BP ����
[net_1,tr]=train(net_1,P,T); 
%  �� BP ������з���
A = sim(net_1,P); 
%  ����������  
E = T - A;   % ���
MSE=mse(E)   % ������

x=[1,3,6,7,9,6,1,0,0,4;
    1,8,2,4,5,7,8,9,0,1];
sim(net_1,x)'   % Ԥ����
toc  % ��ʱ����

