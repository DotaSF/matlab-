function xn=Newton_dd(fun,x0,D)
%牛顿法求解非线性方程的解
% 函数输出：
% xn：为所求非线性方程的解
% 函数输入：
% fun：为所定义的函数	
% x0：为初始值
% D：为计算的精确度
[f0,df]=feval(fun,x0);  % 一阶导数
if df==0;
    error('d[f(x)/dx]=0 at x0');  % 一阶导数为0，不满足牛顿迭代
end
if nargin<3; 
    D=1e-6;  % 缺省值
end
d=f0/df;     % 初始斜率
while abs(d)>D;  % 判断条件
    x1=x0-d;     % 解的更新
    x0=x1;       % 赋值
    [f0,df]=feval(fun,x0);  % 函数值和一阶导数
    if df==0; % 一阶导数
        error('d[f(x)]/dx=0 at x0'); % 一阶导数为0，不满足牛顿迭代
    end
    d=f0/df;  % 更新斜率
end
xn=x1;  % 赋值
end