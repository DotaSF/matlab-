function [pop,score,nonDomRank,Distance]  = rankAndDistance(pop,score,options,nParents)
% rankAndDistance 该函数用于检测每个个体之间的距离
% 如果输入为4个，即缺省了mParents
if nargin < 4
    nParents = size(pop,1);
end
% Pareto系数
ParetoFraction = options.ParetoFraction;
nScore = size(score,2); % 列
if nScore == 1 % 单目标
    nonDomRank = nonDominatedRank(score,nParents);
    % 去除为无穷大的目标值
    index = isinf(nonDomRank);
    nonDomRank(index) = [];
    pop(index,:) = [];
    score(index,:) = [];
else
    nonDomRank = nonDominatedRank(score); % 多目标
end
popSize = size(pop,1);
Distance = zeros(popSize,1);
numRank = unique(nonDomRank); % unique函数用于获取nonDomRank中出现不同的数字

% Compute crowding distance for individuals in each front
for i = numRank'
   % Get individual from each front
   index = (nonDomRank == i);
   Distance(index) = options.DistanceMeasureFcn(pop(index,:),score(index,:),options,options.DistanceMeasureFcnArgs{:}); 
end

% 如果种群之间没有结合，则不需要去除种群
if nParents == popSize
     % do nothing
else % 去除相关种群
    [pop,score,nonDomRank,Distance] = trimPopulation(pop,score,nonDomRank,Distance, ...
        popSize,nScore,nParents,ParetoFraction);
end

