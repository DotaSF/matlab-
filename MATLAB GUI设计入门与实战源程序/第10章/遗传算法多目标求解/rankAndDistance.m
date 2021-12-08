function [pop,score,nonDomRank,Distance]  = rankAndDistance(pop,score,options,nParents)
% rankAndDistance �ú������ڼ��ÿ������֮��ľ���
% �������Ϊ4������ȱʡ��mParents
if nargin < 4
    nParents = size(pop,1);
end
% Paretoϵ��
ParetoFraction = options.ParetoFraction;
nScore = size(score,2); % ��
if nScore == 1 % ��Ŀ��
    nonDomRank = nonDominatedRank(score,nParents);
    % ȥ��Ϊ������Ŀ��ֵ
    index = isinf(nonDomRank);
    nonDomRank(index) = [];
    pop(index,:) = [];
    score(index,:) = [];
else
    nonDomRank = nonDominatedRank(score); % ��Ŀ��
end
popSize = size(pop,1);
Distance = zeros(popSize,1);
numRank = unique(nonDomRank); % unique�������ڻ�ȡnonDomRank�г��ֲ�ͬ������

% Compute crowding distance for individuals in each front
for i = numRank'
   % Get individual from each front
   index = (nonDomRank == i);
   Distance(index) = options.DistanceMeasureFcn(pop(index,:),score(index,:),options,options.DistanceMeasureFcnArgs{:}); 
end

% �����Ⱥ֮��û�н�ϣ�����Ҫȥ����Ⱥ
if nParents == popSize
     % do nothing
else % ȥ�������Ⱥ
    [pop,score,nonDomRank,Distance] = trimPopulation(pop,score,nonDomRank,Distance, ...
        popSize,nScore,nParents,ParetoFraction);
end

