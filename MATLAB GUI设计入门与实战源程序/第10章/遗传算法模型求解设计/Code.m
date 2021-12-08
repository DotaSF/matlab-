function ret=Code(lenchrom,bound)
%本函数将变量编码成染色体，用于随机初始化一个种群
% lenchrom   input : 染色体长度
% bound      input : 变量的取值范围
% ret        output: 染色体的编码值
flag=0;
while flag==0     
    for i=1:lenchrom   % 针对每一个变量，随机取值
        pick = rand*(bound(i,2)-bound(i,1)+1);
        ret(i) = bound(i,1) + pick -1; %线性插值，编码结果以实数向量存入ret中
    end
    %检验染色体的可行性
    flag=test(bound,ret);
end
        
