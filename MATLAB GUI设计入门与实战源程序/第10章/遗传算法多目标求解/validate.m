function [options,gLength,fitness,nonlcon]  = validate(options,type,gLength,fitness,nonlcon,user_options)
%VALIDATE validates the contents of the fitness function, genome length and
%   options struct. 
%   [OUT,nvars,fitness,constr] = VALIDATE(GenomeLength,FitnessFcn,Nonlcon,IN,type) 
%   validates the FitnessFcn, GenomeLength and the structure IN. OUT is a
%   structure which have all the fields in IN and it gets other fields
%   like FitnessFcn, GenomeLength, etc. The output 'nvars' is the number of
%   variables, 'fitness' is the function handle to the fitness function,
%   and 'nonlcon' is the function handle to the nonlinear constraint
%   function. 
%
%   This function is private to GA and GAMULTIOBJ.

if nargin < 6
    user_options = options;
end
% Make sure user_options is consistent with gaoptimset
user_options = gaoptimset(user_options);

% range check each field
stringSet('PopulationType',options.PopulationType,{'doubleVector','custom','bitString'});
% Determine the verbosity
switch  options.Display
    case 'final'
        options.Verbosity = 1;
end

validNumberofVariables(gLength)
% PopulationSize validation
if ischar(options.PopulationSize)
    if strcmpi(options.PopulationSize,'15*numberofvariables')
        options.PopulationSize = 15*gLength;
        options.PopulationSize  = floor(options.PopulationSize);
    elseif strcmpi(options.PopulationSize,'50 when numberOfVariables <= 5, else 200')
        if gLength <= 5
            options.PopulationSize = 50;
        else
            options.PopulationSize = 200;
        end
    end
end
positiveIntegerArray('PopulationSize',options.PopulationSize);
% If population size is a matrix then we want to get the row vector expansion
options.PopulationSize = options.PopulationSize(:)';

% Generations validation
if ischar(options.Generations) 
    if strcmpi(options.Generations,'200*numberofvariables')
        options.Generations = 200*gLength;
        options.Generations = floor(options.Generations);
    elseif strcmpi(options.Generations,'100*numberofvariables')
        options.Generations = 100*gLength;
        options.Generations = floor(options.Generations);
    end
end
positiveInteger('Generations',options.Generations);

% These options does not apply to gamultiobj
if ~isempty(options.FitnessLimit) 
    realScalar('FitnessLimit',options.FitnessLimit);
end
if ~isempty(options.StallTimeLimit)
    positiveScalar('StallTimeLimit',options.StallTimeLimit);
end
if ~isempty(options.FitnessScalingFcn) 
    [options.FitnessScalingFcn,options.FitnessScalingFcnArgs] = functionHandleOrCell('FitnessScalingFcn',options.FitnessScalingFcn);
end
% Elite count validation
if ischar(options.EliteCount) && strcmpi(options.EliteCount,'0.05*PopulationSize')
    options.EliteCount = floor(0.05*mean(options.PopulationSize));
elseif ~isempty(options.EliteCount)
    % Protect against EliteCount greater than PopulationSize.
    if options.EliteCount >= sum(options.PopulationSize)
        error(message('globaloptim:validate:EliteCountGTPop'));
    end
end

% These fields does not apply to GA
if ~isempty(options.ParetoFraction)
    realUnitScalar('ParetoFraction',options.ParetoFraction);
end
if ~isempty(options.DistanceMeasureFcn)
     [options.DistanceMeasureFcn,options.DistanceMeasureFcnArgs] = functionHandleOrCell('DistanceMeasureFcn',options.DistanceMeasureFcn);
end

stringSet('Vectorized',options.Vectorized,{'on','off'});
realUnitScalar('CrossoverFraction',options.CrossoverFraction);
positiveInteger('MigrationInterval',options.MigrationInterval);
realUnitScalar('MigrationFraction',options.MigrationFraction);
stringSet('MigrationDirection',options.MigrationDirection,{'both','forward'});
nonNegScalar('TolFun',options.TolFun);
nonNegScalar('TolCon',options.TolCon);
positiveScalar('TimeLimit',options.TimeLimit);
positiveInteger('StallGenLimit',options.StallGenLimit);

positiveInteger('PlotInterval',options.PlotInterval);

if ~isempty(options.UseParallel)
   options.SerialUserFcn = ~validateopts_UseParallel(options.UseParallel,true,true);
else
    options.SerialUserFcn = true;
end

% Creation function for constrained GA has different default
% Creation function for linearly constrained GA has different default

% Creation function for constrained GA has different default
if isempty(user_options.CreationFcn) && strcmp(type,'linearconstraints')
    options.CreationFcn = @gacreationlinearfeasible;
    options.CreationFcnArgs = {};
else
    [options.CreationFcn,options.CreationFcnArgs] = functionHandleOrCell('CreationFcn',options.CreationFcn);
end

% Crossover function for linearly constrained GA has different default
if isempty(user_options.CrossoverFcn) && strcmp(type,'linearconstraints')
    options.CrossoverFcn = @crossoverintermediate;
    options.CrossoverFcnArgs = {};
else
    [options.CrossoverFcn,options.CrossoverFcnArgs] = functionHandleOrCell('CrossoverFcn',options.CrossoverFcn);
end

[options.SelectionFcn,options.SelectionFcnArgs] = functionHandleOrCell('SelectionFcn',options.SelectionFcn);

% Mutation function validation
if isempty(user_options.MutationFcn) && ~strcmp(type,'unconstrained')
    % Mutation function for constrained GA has different default
    options.MutationFcn = @mutationadaptfeasible;
    options.MutationFcnArgs = {};
else
    [options.MutationFcn,options.MutationFcnArgs] = functionHandleOrCell('MutationFcn',options.MutationFcn);
end

if ~isempty(options.HybridFcn)
    [options.HybridFcn,options.HybridFcnArgs] = functionHandleOrCell('HybridFcn',options.HybridFcn);
    stringSet('HybridFcn',func2str(options.HybridFcn),{'patternsearch','fminsearch','fminunc','fmincon','fgoalattain'});
    
    % If the user has set a hybrid function, they can specify options for the
    % hybrid function. If a user has passed a SolverOptions object for these
    % options, convert the options object to a structure. Note that we will not
    % warn here if a user specifies a solver with a different solver's options.
    if ~isempty(options.HybridFcnArgs) ...
            && isa(options.HybridFcnArgs{1}, 'optim.options.SolverOptions')
        % It is possible for a user to pass in a vector of options to the
        % solver. Silently use the first element in this array.
        options.HybridFcnArgs{1} = options.HybridFcnArgs{1}(1);
        
        % Extract the options structure
        options.HybridFcnArgs{1} = extractOptionsStructure(options.HybridFcnArgs{1});
    end
    
end

[options.PlotFcns,options.PlotFcnsArgs] = functionHandleOrCellArray('PlotFcns',options.PlotFcns);
[options.OutputFcns,options.OutputFcnsArgs] = functionHandleOrCellArray('OutputFcns',options.OutputFcns);

options.FitnessFcnArgs = {};
options.NonconFcnArgs = {};
if ~isempty(fitness)
    [fitness,FitnessFcnArgs] = functionHandleOrCell('FitnessFcn',fitness);
    fitness = createAnonymousFcn(fitness,FitnessFcnArgs);
else
    fitness = [];
end
if ~isempty(nonlcon)
    [nonlcon,NonconFcnArgs] = functionHandleOrCell('NonconFcn',nonlcon);
    nonlcon = createAnonymousFcn(nonlcon,NonconFcnArgs);
else
    nonlcon = [];
end

% Adjust PopInitRange, if necessary
options = rangeCorrection(gLength,options);

if ~isnumeric(gaoptimget(options,'InitialPopulation'))
    error(message('globaloptim:validate:invalidInitialPopulation'));
end
if ~isnumeric(gaoptimget(options,'InitialScores'))
    error(message('globaloptim:validate:invalidInitialScores'));
end

% Make sure that initial population is consistent with GenomeLength
if ~isempty(options.InitialPopulation) && size(options.InitialPopulation,2) ~= gLength
    error(message('globaloptim:validate:wrongSizeInitialPopulation'));
end


%-------------------------------------------------------------------------------

% Number of variables
function validNumberofVariables(GenomeLength)
valid =  isnumeric(GenomeLength) && isscalar(GenomeLength)&& (GenomeLength > 0) ...
         && (GenomeLength == floor(GenomeLength));
if ~valid
   error(message('globaloptim:validate:validNumberofVariables:notValidNvars'));
end

%------------------------------------------------------------------------------
function options = rangeCorrection(nvars,options)
%rangeCorrection Check the size and consistency of PopInitRange

Range = options.PopInitRange;

lb = Range(1,:);
lb = lb(:);
lenlb = length(lb);
ub = Range(2,:);
ub = ub(:);
lenub = length(ub);

% Check maximum length
if lenlb > nvars
   lb = lb(1:nvars);   
elseif lenlb < nvars
   lb = [lb; lb(end)*ones(nvars-lenlb,1)];
end

if lenub > nvars
   ub = ub(1:nvars);
elseif lenub < nvars
   ub = [ub; ub(end)*ones(nvars-lenub,1)];
end
   
if any( lb > ub )
    count = nnz(lb > ub);
    error(message('globaloptim:validate:infeasibleRange',count));
end

options.PopInitRange = [lb,ub]';
%------------------------------End of rangeCorrection --------------------------


