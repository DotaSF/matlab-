function [x,n]=jacobi(A,b,x0,eps,varargin)
% 采用Jacobi迭代法求线性方程组Ax=b的解
% 函数输入：
% A：线性方程组的系数矩阵
% b：线性方程组中的常数向量
% x0：迭代初始向量
% eps：解的精度控制
% varargin：迭代步数控制

% 函数输出
% x：线性方程组的解
% n：求出所需精度的解实际的迭代步数
if nargin==3
    eps= 1.0e-6; % 缺省值
elseif nargin<3
    error('输入错误')  % 输入错误
    return
elseif nargin ==5
    M  = varargin{1};
end  
M  = 500;   % 迭代次数
    
D=diag(diag(A));	%求A的对角矩阵
L=-tril(A,-1);   	%求A的下三角阵
U=-triu(A,1);   		%求A的上三角矩阵
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;               	%迭代次数
%迭代过程
while norm(x-x0)>=eps
    x0=x;      % 赋值
    x =B*x0+f; % 值更新
    n=n+1;
    if(n>=M)
        disp('Warning:迭代次数太多，可能不收敛！');
        return;
    end
end
