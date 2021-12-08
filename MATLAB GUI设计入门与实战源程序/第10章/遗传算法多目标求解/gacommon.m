function [x,fval,exitFlag,output,population,scores,FitnessFcn,nvars,Aineq,bineq,Aeq,beq,lb,ub, ...
    NonconFcn,options,Iterate,type] = gacommon(nvars,fun,Aineq,bineq,Aeq,beq,lb,ub,nonlcon,intcon,options,user_options,output)
% 检测个体是否满足约束条件

% 设定个体类型
stringSet('PopulationType',options.PopulationType,{'doubleVector','custom','bitString'});

% 确定研究问题的类型，非线性或者是带约束和不带约束
if (~isempty(Aeq)   && ~all(Aeq(:) == 0))   || ~isempty(beq) || ... 
       (~isempty(Aineq) && ~all(Aineq(:) == 0)) || ~isempty(bineq)
       type = 'linearconstraints';  % 线性约束，非线性约束为空
elseif (~isempty(lb) && any(isfinite(lb))) || ...
       (~isempty(ub) && any(isfinite(ub)))
    type = 'boundconstraints';  % 个体是有取值范围的，是有边界的，[-b,ub]
else
    type = 'unconstrained';     % 没有约束
end

output.problemtype = type;

% Remember the random number state used
dflt = RandStream.getGlobalStream;
output.rngstate = struct('state',{dflt.State}, 'type',{dflt.Type});
% 初始化 other fields of output
output.generations = 0;
output.funccount   = 0;
output.message   = '';

% 检验options和适应度函数fitness function
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
% 初始化输出
fval = [];
x = [];
population = [];
scores = [];

% 变量取值边界检验
[lb,ub,msg,exitFlag] = checkbound(lb,ub,nvars);
if exitFlag < 0
    output.message = msg;
    if options.Verbosity > 0
        fprintf('%s\n',msg)
    end
    return;
end
% 线性约束检验，并correction
[Iterate.x,Aineq,bineq,Aeq,beq,lb,ub,msg,exitFlag] = ...
    preProcessLinearConstr(Iterate.x,Aineq,bineq,Aeq,beq,lb,ub,nvars,type,options.Verbosity);
if exitFlag < 0
    output.message = msg;
    if options.Verbosity > 0
        fprintf('%s\n',msg)
    end
    return;
end

% 验证初始化产生的个体，是否满足约束条件 
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

% 如果初始化的个体为空，且无整数约束
if isempty(options.InitialPopulation) && ~isempty(Iterate.x) && isempty(intcon)
    options.InitialPopulation(1,:) = Iterate.x';
end

% 检验非线性约束 nonlinear constraints
[LinearConstr, Iterate,nineqcstr,neqcstr,ncstr] = constrValidate(NonconFcn, ...
    Iterate,Aineq,bineq,Aeq,beq,lb,ub,intcon,type,options);
options.LinearConstr = LinearConstr;

% 增加整型变量选项integer constraint field
options.IntegerVars = [];

% 确保种群个体取值在 取值范围内
options = checkPopulationInitRange(lb,ub,options);
