function [x,fval,exitFlag,output,population,scores] = ga_multiobj(fun,nvars,Aineq,bineq,Aeq,beq,lb,ub,options)
% 多目标求解，求多个目标的最小值
%       min F(X)  subject to:  A*X <= b, Aeq*X = beq (linear constraints)
%        X                     lb <= X <= ub (bound constraints)
% 返回的为X的解集

%   Example:
%    Multiobjective minimization of two functions 'ackleyfcn' and 'shufcn'
%
%      fun1 = @(x) ackleyfcn(x);
%      fun2 = @(x) shufcn(x);
%      % Combine two objectives 'fun1' and 'fun2' 
%      fun1and2 = @(x) [fun1(x) fun2(x)];
%      % Bound constraints on X
%      lb = [-10 -10]; ub = [10 10];
%      % Specify the initial range for population
%      options = gaoptimset('PopInitRange',[lb;ub]);
%      % Minimize using GAMULTIOBJ
%      [x,fval] = gamultiobj(fun1and2,2,[],[],[],[],lb,ub,options)
% 结构体设置
defaultopt = struct('PopulationType', 'doubleVector', ...
    'PopInitRange', [], ...
    'PopulationSize', '50 when numberOfVariables <= 5, else 200', ...
    'CrossoverFraction', 0.8, ...
    'ParetoFraction', 0.35, ...
    'MigrationDirection','forward', ...
    'MigrationInterval',20, ...
    'MigrationFraction',0.2, ...
    'Generations', '200*numberOfVariables', ...
    'TimeLimit', inf, ...      % 时间无限制
    'StallGenLimit', 100, ...  % 停滞代数
    'TolFun', 1e-4, ...       % 最小误差
    'TolCon', 1e-6, ...   
    'InitialPopulation',[], ...
    'InitialScores', [], ...   % 初始种群的函数值
    'PlotInterval',1, ...
    'CreationFcn',@gacreationuniform, ...
    'SelectionFcn', {{@selectiontournament,2}}, ...
    'CrossoverFcn',@crossoverintermediate, ...
    'MutationFcn',@mutationadaptfeasible, ...
    'DistanceMeasureFcn',{{@distancecrowding, 'phenotype'}}, ...
    'HybridFcn',[], ...
    'Display', 'final', ... 
    'PlotFcns', [], ...
    'OutputFcns', [], ...
    'Vectorized', 'off', ...
    'UseParallel', false);  % 是否使用并行计算

% 如果输入小于等于1，则采用系统默认设置
if nargin == 1 && nargout <= 1 && isequal(fun,'defaults')
    x = defaultopt;
    return
end

% 检查输入变量是否超出函数设置变量
try 
    narginchk(1,9);
catch ME
    error(message('输入变量个数有误'));
end
% 缺省值设置
if nargin < 9,  options = [];
    if nargin < 8, ub = [];
        if nargin < 7, lb = [];
            if nargin <6, beq = [];
                if nargin <5, Aeq = [];
                    if nargin < 4, bineq = [];
                        if nargin < 3, Aineq = [];
                        end
                    end
                end
            end
        end
    end
end

% 如果函数fun为一个cell结构体
if iscell(fun)
    FitnessFcn = fun{1}; % 适应度函数
else
    FitnessFcn = fun;
end

% 检查适应度函数（目标函数）类型
if isempty(FitnessFcn) ||  ~(isa(FitnessFcn,'inline') || isa(FitnessFcn,'function_handle'))
    error(message('目标函数结构体设置错误'));
end

% 变量个数类型检查
valid =  isnumeric(nvars) && isscalar(nvars)&& (nvars > 0) ...
    && (nvars == floor(nvars));
if ~valid
    error(message('变量个数设置错误'));
end

user_options = options;
defaultopt.PopInitRange = [0;1];  % 默认初始化种群范围

% 如果option为空，则采用默认设置
if ~isempty(options) && ~isa(options,'struct')
    error(message('选项options设置错误'));
elseif isempty(options)
    options = defaultopt;
end

% 合并参数选项设置
options = gaoptimset(defaultopt,options);

% 如果用户没有给定初始范围，则采用系统默认个体范围设置
options.UserSpecPopInitRange = 1;

% 初始化 unused variable for nonlcon
nonlcon = [];

% 验证模型约束条件
[x,fval,exitFlag,output,population,scores,FitnessFcn,nvars,Aineq,bineq,Aeq,beq,lb,ub, ...
    ~,options] = gacommon(nvars,fun,Aineq,bineq,Aeq,beq,lb,ub,nonlcon,[],options,user_options);

if exitFlag < 0 % Infeasibility
    return;
end

% 单目标优化求解器
[x,fval,exitFlag,output,population,scores] = gamultiobjsolve(FitnessFcn,nvars, ...
     Aineq,bineq,Aeq,beq,lb,ub,options,output);

 
