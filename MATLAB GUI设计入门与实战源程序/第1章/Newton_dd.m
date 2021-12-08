function xn=Newton_dd(fun,x0,D)
%ţ�ٷ��������Է��̵Ľ�
% ���������
% xn��Ϊ��������Է��̵Ľ�
% �������룺
% fun��Ϊ������ĺ���	
% x0��Ϊ��ʼֵ
% D��Ϊ����ľ�ȷ��
[f0,df]=feval(fun,x0);  % һ�׵���
if df==0;
    error('d[f(x)/dx]=0 at x0');  % һ�׵���Ϊ0��������ţ�ٵ���
end
if nargin<3; 
    D=1e-6;  % ȱʡֵ
end
d=f0/df;     % ��ʼб��
while abs(d)>D;  % �ж�����
    x1=x0-d;     % ��ĸ���
    x0=x1;       % ��ֵ
    [f0,df]=feval(fun,x0);  % ����ֵ��һ�׵���
    if df==0; % һ�׵���
        error('d[f(x)]/dx=0 at x0'); % һ�׵���Ϊ0��������ţ�ٵ���
    end
    d=f0/df;  % ����б��
end
xn=x1;  % ��ֵ
end