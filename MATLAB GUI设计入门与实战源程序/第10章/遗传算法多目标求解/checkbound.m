function [lb,ub,msg,exitflag] = checkbound(lbin,ubin,nvars)
% ��֤ LB <= UB
% ��ʼ��
msg = [];
exitflag = 1;

% Turn into column vectors
lb = lbin(:); 
ub = ubin(:); 
lenlb = length(lb);
lenub = length(ub);

% Check maximum length
if lenlb > nvars
       warning(message('����ȡֵ��Χ���ȴ��ڱ�������'));
       lb = lb(1:nvars);   
    lenlb = nvars;
elseif lenlb < nvars
    lb = [lb; -inf*ones(nvars-lenlb,1)];
    lenlb = nvars;
end

if lenub > nvars
       warning(message('����ȡֵ��Χ���ȴ��ڱ�������'));
       ub = ub(1:nvars);
    lenub = nvars;
elseif lenub < nvars
    ub = [ub; inf*ones(nvars-lenub,1)];
    lenub = nvars;
end

% ����߽������
len = min(lenlb,lenub);
if any( lb( (1:len)' ) > ub( (1:len)' ) )
   count = full(sum(lb>ub));
   msg=sprintf(['ȡֵ�������޴������ޣ������'],count);
   exitflag = -2;
end

% ��������޵ķ�Χ
if any(eq(ub, -inf))    % ����Ϊ -inf�������
   error(message('����������'));
elseif any(eq(lb,inf))  % ����Ϊ inf�����
   error(message('����������'));
end







