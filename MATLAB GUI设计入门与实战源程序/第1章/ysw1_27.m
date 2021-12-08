% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
m=20;  % 六面体中点数
n=100; % 锥体中点数
t=linspace(0,2*pi,n); % 点
r=linspace(0,1,m);    % 半径
x=r'*cos(t);  % x
y=r'*sin(t);  % y
z1=sqrt(x.^2+y.^2); % 半径
z2=1+sqrt(1+eps-x.^2-y.^2); % 体积二
X=[x;x];Y=[y;y]; % 矩阵扩充
Z=[z1;z2];       % 矩阵扩充
figure('color',[1,1,1])
mesh(X,Y,Z)  % 3D曲面
view(0,-18)  % 视角
colormap([0 0 1]),axis off % 取消轴显示
toc  % 计时结束'

%% 求体积
% Designed by Yu Shengwei From SWJTU University
% 2014年12月29日
clc,clear,close all  % 清理命令区、清理工作区、关闭显示图形
warning off       % 消除警告
feature jit off      % 加速代码运行
format short
tic  % 运算计时
L=7; % 重复计算次数
N=10000; % 点数
for k=1:L
    P=rand(N,3);
    x=2*P(:,1)-1;
    y=2*P(:,2)-1;
    z=2*P(:,3);
    R2=x.^2+y.^2;
    R=sqrt(R2);   % 半径
    II=find(z>=R&z<=1+sqrt(1-R2)); % 满足不等式
    m=length(II);
    q(k)=8*m/N;  % 体积
end
error=q-pi % 误差
figure('color',[1,1,1])
plot(x(II),y(II),'bp') % 画出x,y视图
toc  % 计时结束

