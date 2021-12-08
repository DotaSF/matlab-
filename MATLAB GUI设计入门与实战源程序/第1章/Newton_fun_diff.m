function [y,dy,d2y] = Newton_fun_diff(x)
% y为在x处的函数值
% dy为一阶导数
% d2y为二阶导数
y = x-log(x)-2;            % 计算函数值
if nargout>1;
    ff=sym('x-log(x)-2');  % 定义符号函数
    dy=diff(ff);           % 求一阶导数
    dy=subs(dy,x);         % 赋值
end
if nargout==3;
    d2y=diff(ff,2);      % 求2阶导数
    d2y=subs(d2y,x);     % 赋值
end
