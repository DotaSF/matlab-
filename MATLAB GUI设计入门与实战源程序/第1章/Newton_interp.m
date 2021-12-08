function f = Newton_interp(x,y,x0)
% x,y输入输出变量
% x0为插值点处的横坐标值
syms t; % 符号变量
if(length(x) == length(y))  % 维数相等，说明数据维数合理
    n = length(x); % 数据长度
    c(1:n) = 0.0;  % 初始化
else
    disp('x和y的维数不相等！');
    return;
end

f = y(1); % 初始值
y1 = 0;   % 初始化
l  = 1;  % 初始化
 
for i = 1:(n-1)
    for j = (i+1):n
        y1(j) = (y(j)-y(i))/(x(j)-x(i)); % 斜率
    end
    c(i) = y1(i+1);  % 斜率值
    l = l*(t-x(i));  % 均差
    f = f + c(i)*l;  % 直线方程
    simplify(f);     % 简化f直线方程
    
    if(i==n-1)
        if(nargin == 3)
            f = subs(f,'t',x0);  % 赋值，在x0出的y值
        else
            f = collect(f);      % 将插值多项式展开
            f = vpa(f, 6);       % 显示精度为6位小数
        end
    end
    y = y1;          % 赋值
end



