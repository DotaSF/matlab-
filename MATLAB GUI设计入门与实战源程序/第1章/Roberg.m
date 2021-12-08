function [I,step]=Roberg(f,a,b,eps)
%龙贝格积分法
% I:    积分值
% step: 积分划分的子区间次数
%  f:   函数名
%  a:   积分下限
%  b:   积分上限
%  eps: 积分精度
if(nargin==3)   % 如果缺省eps的情况下
    eps=1.0e-4; % 默认值
end;
M=1;           % 初始化
tol=10;        % 前后两次积分差值
k=0;           % 初始化
T=zeros(1,1);  % 初始化
h=b-a;         % 积分区间长度
% 计算首项
T(1,1)=(h/2)*(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b)); %初始值

while tol>eps
    k=k+1;  % 下标
    h=h/2;  % 区间长度
    Q=0;
    for i=1:M
        x=a+h*(2*i-1);
        Q=Q+subs(sym(f),findsym(sym(f)),x); % 积分
    end
    T(k+1,1)=T(k,1)/2+h*Q;
    M=2*M;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1); % 更新T
    end
    tol=abs(T(k+1,j+1)-T(k,j));  % 前后两次积分差值
end
I=T(k+1,k+1);
step=k;   % 积分划分的子区间次数
