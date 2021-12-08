clc,clear,close all
warning off
feature jit off
nvars = 2;
lb=[-10 ,  -10 ];
ub=[10 ,  10 ];
A=[];   b=[];
Aeq=[]; beq=[];
%% 遗传算法多目标求解
options=gaoptimset('ParetoFraction',0.3 ,'PopulationSize',10,...
    'CrossoverFraction',0.9,'MigrationFraction',0.05,...
    'Generations',200,'StallGenLimit',100,'TolFun',1e-100,'PlotFcns',@gaplotpareto);
[x,fval]=ga_multiobj(@(x)nsga_fitness(x),nvars,A,b,Aeq,beq,lb,ub,options)





