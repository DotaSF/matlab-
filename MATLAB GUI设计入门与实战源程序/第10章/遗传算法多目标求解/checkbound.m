function [lb,ub,msg,exitflag] = checkbound(lbin,ubin,nvars)
% 保证 LB <= UB
% 初始化
msg = [];
exitflag = 1;

% Turn into column vectors
lb = lbin(:); 
ub = ubin(:); 
lenlb = length(lb);
lenub = length(ub);

% Check maximum length
if lenlb > nvars
       warning(message('变量取值范围长度大于变量个数'));
       lb = lb(1:nvars);   
    lenlb = nvars;
elseif lenlb < nvars
    lb = [lb; -inf*ones(nvars-lenlb,1)];
    lenlb = nvars;
end

if lenub > nvars
       warning(message('变量取值范围长度大于变量个数'));
       ub = ub(1:nvars);
    lenub = nvars;
elseif lenub < nvars
    ub = [ub; inf*ones(nvars-lenub,1)];
    lenub = nvars;
end

% 检验边界可行性
len = min(lenlb,lenub);
if any( lb( (1:len)' ) > ub( (1:len)' ) )
   count = full(sum(lb>ub));
   msg=sprintf(['取值变量下限大于上限，请检验'],count);
   exitflag = -2;
end

% 检测上下限的范围
if any(eq(ub, -inf))    % 上限为 -inf（负无穷）
   error(message('上限有问题'));
elseif any(eq(lb,inf))  % 下限为 inf（无穷）
   error(message('下限有问题'));
end







