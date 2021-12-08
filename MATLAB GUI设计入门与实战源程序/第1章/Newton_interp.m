function f = Newton_interp(x,y,x0)
% x,y�����������
% x0Ϊ��ֵ�㴦�ĺ�����ֵ
syms t; % ���ű���
if(length(x) == length(y))  % ά����ȣ�˵������ά������
    n = length(x); % ���ݳ���
    c(1:n) = 0.0;  % ��ʼ��
else
    disp('x��y��ά������ȣ�');
    return;
end

f = y(1); % ��ʼֵ
y1 = 0;   % ��ʼ��
l  = 1;  % ��ʼ��
 
for i = 1:(n-1)
    for j = (i+1):n
        y1(j) = (y(j)-y(i))/(x(j)-x(i)); % б��
    end
    c(i) = y1(i+1);  % б��ֵ
    l = l*(t-x(i));  % ����
    f = f + c(i)*l;  % ֱ�߷���
    simplify(f);     % ��fֱ�߷���
    
    if(i==n-1)
        if(nargin == 3)
            f = subs(f,'t',x0);  % ��ֵ����x0����yֵ
        else
            f = collect(f);      % ����ֵ����ʽչ��
            f = vpa(f, 6);       % ��ʾ����Ϊ6λС��
        end
    end
    y = y1;          % ��ֵ
end



