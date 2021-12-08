function [x,fval,exitFlag,output,population,scores,FitnessFcn,nvars,Aineq,bineq,Aeq,beq,lb,ub, ...
    NonconFcn,options,Iterate,type] = gacommon(nvars,fun,Aineq,bineq,Aeq,beq,lb,ub,nonlcon,intcon,options,user_options,output)
% �������Ƿ�����Լ������

% �趨��������
stringSet('PopulationType',options.PopulationType,{'doubleVector','custom','bitString'});

% ȷ���о���������ͣ������Ի����Ǵ�Լ���Ͳ���Լ��
if (~isempty(Aeq)   && ~all(Aeq(:) == 0))   || ~isempty(beq) || ... 
       (~isempty(Aineq) && ~all(Aineq(:) == 0)) || ~isempty(bineq)
       type = 'linearconstraints';  % ����Լ����������Լ��Ϊ��
elseif (~isempty(lb) && any(isfinite(lb))) || ...
       (~isempty(ub) && any(isfinite(ub)))
    type = 'boundconstraints';  % ��������ȡֵ��Χ�ģ����б߽�ģ�[-b,ub]
else
    type = 'unconstrained';     % û��Լ��
end

output.problemtype = type;

% Remember the random number state used
dflt = RandStream.getGlobalStream;
output.rngstate = struct('state',{dflt.State}, 'type',{dflt.Type});
% ��ʼ�� other fields of output
output.generations = 0;
output.funccount   = 0;
output.message   = '';

% ����options����Ӧ�Ⱥ���fitness function
[options,nvars,FitnessFcn,NonconFcn] = validate(options,type,nvars,fun,nonlcon,user_options);

% Perform check on initial population, score, and range
options = initialPopulationCheck(options);

if ~strcmp(output.problemtype,'unconstrained') 
    % Determine a start point
    if ~isempty(options.InitialPopulation)
        x = options.InitialPopulation(1,:);
    else
        x = randn(1,nvars);
    end
    Iterate.x = x(:);
else
    Iterate.x = [];
end
% ��ʼ�����
fval = [];
x = [];
population = [];
scores = [];

% ����ȡֵ�߽����
[lb,ub,msg,exitFlag] = checkbound(lb,ub,nvars);
if exitFlag < 0
    output.message = msg;
    if options.Verbosity > 0
        fprintf('%s\n',msg)
    end
    return;
end
% ����Լ�����飬��correction
[Iterate.x,Aineq,bineq,Aeq,beq,lb,ub,msg,exitFlag] = ...
    preProcessLinearConstr(Iterate.x,Aineq,bineq,Aeq,beq,lb,ub,nvars,type,options.Verbosity);
if exitFlag < 0
    output.message = msg;
    if options.Verbosity > 0
        fprintf('%s\n',msg)
    end
    return;
end

% ��֤��ʼ�������ĸ��壬�Ƿ�����Լ������ 
if ~isempty(options.InitialPopulation) && ~strcmp(type,'unconstrained')
    pop = size(options.InitialPopulation,1);
    feasible = true(pop,1);
    for i = 1:pop
        feasible(i) = isTrialFeasible(options.InitialPopulation(i,:)',Aineq,bineq,Aeq,beq,lb,ub,options.TolCon);
    end
    options.InitialPopulation(~feasible,:) = [];
    try % InitialScores may not be present
        options.InitialScores(~feasible,:) = [];
    catch
    end
end

% �����ʼ���ĸ���Ϊ�գ���������Լ��
if isempty(options.InitialPopulation) && ~isempty(Iterate.x) && isempty(intcon)
    options.InitialPopulation(1,:) = Iterate.x';
end

% ���������Լ�� nonlinear constraints
[LinearConstr, Iterate,nineqcstr,neqcstr,ncstr] = constrValidate(NonconFcn, ...
    Iterate,Aineq,bineq,Aeq,beq,lb,ub,intcon,type,options);
options.LinearConstr = LinearConstr;

% �������ͱ���ѡ��integer constraint field
options.IntegerVars = [];

% ȷ����Ⱥ����ȡֵ�� ȡֵ��Χ��
options = checkPopulationInitRange(lb,ub,options);
