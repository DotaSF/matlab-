function flag=test(bound,ret)
% lenchrom   input : 染色体长度
% bound      input : 变量的取值范围
% ret        output: 染色体的编码值
x = ret; % 先解码
%检验染色体的可行性

if max(ret)<=bound(1,2)&min(ret)>=bound(1,1)
    flag=1;  % 可行
else
    flag=0;
end 

  