function [x,fval,exitFlag,output,population,scores] = ga_multiobj(fun,nvars,Aineq,bineq,Aeq,beq,lb,ub,options)
% ��Ŀ����⣬����Ŀ�����Сֵ
%       min F(X)  subject to:  A*X <= b, Aeq*X = beq (linear constraints)
%        X                     lb <= X <= ub (bound constraints)
% ���ص�ΪX�Ľ⼯

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
% �ṹ������
defaultopt = struct('PopulationType', 'doubleVector', ...
    'PopInitRange', [], ...
    'PopulationSize', '50 when numberOfVariables <= 5, else 200', ...
    'CrossoverFraction', 0.8, ...
    'ParetoFraction', 0.35, ...
    'MigrationDirection','forward', ...
    'MigrationInterval',20, ...
    'MigrationFraction',0.2, ...
    'Generations', '200*numberOfVariables', ...
    'TimeLimit', inf, ...      % ʱ��������
    'StallGenLimit', 100, ...  % ͣ�ʹ���
    'TolFun', 1e-4, ...       % ��С���
    'TolCon', 1e-6, ...   
    'InitialPopulation',[], ...
    'InitialScores', [], ...   % ��ʼ��Ⱥ�ĺ���ֵ
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
    'UseParallel', false);  % �Ƿ�ʹ�ò��м���

% �������С�ڵ���1�������ϵͳĬ������
if nargin == 1 && nargout <= 1 && isequal(fun,'defaults')
    x = defaultopt;
    return
end

% �����������Ƿ񳬳��������ñ���
try 
    narginchk(1,9);
catch ME
    error(message('���������������'));
end
% ȱʡֵ����
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

% �������funΪһ��cell�ṹ��
if iscell(fun)
    FitnessFcn = fun{1}; % ��Ӧ�Ⱥ���
else
    FitnessFcn = fun;
end

% �����Ӧ�Ⱥ�����Ŀ�꺯��������
if isempty(FitnessFcn) ||  ~(isa(FitnessFcn,'inline') || isa(FitnessFcn,'function_handle'))
    error(message('Ŀ�꺯���ṹ�����ô���'));
end

% �����������ͼ��
valid =  isnumeric(nvars) && isscalar(nvars)&& (nvars > 0) ...
    && (nvars == floor(nvars));
if ~valid
    error(message('�����������ô���'));
end

user_options = options;
defaultopt.PopInitRange = [0;1];  % Ĭ�ϳ�ʼ����Ⱥ��Χ

% ���optionΪ�գ������Ĭ������
if ~isempty(options) && ~isa(options,'struct')
    error(message('ѡ��options���ô���'));
elseif isempty(options)
    options = defaultopt;
end

% �ϲ�����ѡ������
options = gaoptimset(defaultopt,options);

% ����û�û�и�����ʼ��Χ�������ϵͳĬ�ϸ��巶Χ����
options.UserSpecPopInitRange = 1;

% ��ʼ�� unused variable for nonlcon
nonlcon = [];

% ��֤ģ��Լ������
[x,fval,exitFlag,output,population,scores,FitnessFcn,nvars,Aineq,bineq,Aeq,beq,lb,ub, ...
    ~,options] = gacommon(nvars,fun,Aineq,bineq,Aeq,beq,lb,ub,nonlcon,[],options,user_options);

if exitFlag < 0 % Infeasibility
    return;
end

% ��Ŀ���Ż������
[x,fval,exitFlag,output,population,scores] = gamultiobjsolve(FitnessFcn,nvars, ...
     Aineq,bineq,Aeq,beq,lb,ub,options,output);

 
