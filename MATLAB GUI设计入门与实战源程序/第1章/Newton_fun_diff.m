function [y,dy,d2y] = Newton_fun_diff(x)
% yΪ��x���ĺ���ֵ
% dyΪһ�׵���
% d2yΪ���׵���
y = x-log(x)-2;            % ���㺯��ֵ
if nargout>1;
    ff=sym('x-log(x)-2');  % ������ź���
    dy=diff(ff);           % ��һ�׵���
    dy=subs(dy,x);         % ��ֵ
end
if nargout==3;
    d2y=diff(ff,2);      % ��2�׵���
    d2y=subs(d2y,x);     % ��ֵ
end
