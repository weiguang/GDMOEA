% Base
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA120
% Project Title: Non-dominated Sorting Genetic Algorithm II (NSGA-II)
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%
% Weiguang Chen
% Contact Info: chen2621978@163.com
%

clc;
clear;
close all;


%% Problem Definition
CostFunction=@(x) MOP4(x);      % Cost Function % 解决的问题
nVar= 3;             % Number of Decision Variables %自变量个数
VarMin= -5;          % Lower Bound of Variables %自变量的下限
VarMax= 5;          % Upper Bound of Variables %自变量的上限

VarSize=[1 nVar];   % Size of Decision Variables Matrix

% Number of Objective Functions
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));

%% Parameters
MaxIt = 200;      % Maximum Number of Iterations

nPop = 50;        % Population Size

pCrossover = 0.7;                         % Crossover Percentage
nCrossover = 2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation = 0.4;                          % Mutation Percentage
nMutation = round(pMutation*nPop);        % Number of Mutants

mu = 0.02;                    % Mutation Rate

sigma = 0.1*(VarMax-VarMin);  % Mutation Step Size

rou = 1;
rouMax = 1;
rouMin = 0.1;

Info.nVar = nVar;
Info.VarMin = VarMin;
Info.VarMax = VarMax;
Info.nObj = nObj;
Info.k = 4; %聚类数
Info.nPop = nPop;

%% Initialization
empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

% Jam
empty_individual.GDistion = [];
empty_individual.FSorting = [];


pop=repmat(empty_individual,nPop,1);

for i=1:nPop
    
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    pop(i).Cost=CostFunction(pop(i).Position);
    
end

% Jam
   pop = CalcGDRegressDistance(pop, Info);

% % Non-Dominated Sorting
% [pop, F]=NonDominatedSorting(pop);
% 
% % Calculate Crowding Distance
% pop=CalcCrowdingDistance(pop,F);
% 
% % Sort Population
% [pop, F]=SortPopulation(pop);

%% Main Loop
for it=1:MaxIt
    
    % Crossover
    popc=repmat(empty_individual,nCrossover/2,2);
    for k=1:nCrossover/2
        
        i1=randi([1 nPop]);
        p1=pop(i1);
        
        i2=randi([1 nPop]);
        p2=pop(i2);
        
        [popc(k,1).Position, popc(k,2).Position]=Crossover(p1.Position,p2.Position);
        
        popc(k,1).Cost=CostFunction(popc(k,1).Position);
        popc(k,2).Cost=CostFunction(popc(k,2).Position);
        
    end
    popc=popc(:);
    
    % Mutation
    popm=repmat(empty_individual,nMutation,1);
    for k=1:nMutation
        
        i=randi([1 nPop]);
        p=pop(i);
        
        popm(k).Position=Mutate(p.Position,mu,sigma);
        
        popm(k).Cost=CostFunction(popm(k).Position);
        
    end
    
    % Merge
    pop=[pop
         popc
         popm]; %#ok
     
    
    % Non-Dominated Sorting
    [pop, F]=NonDominatedSorting(pop);
    
     % Calculate Crowding Distance
     pop=CalcCrowdingDistance(pop,F);

    if (length(F) > 3) && (length(F{1}) < nPop * 0.9 )

        % Sort Population
        pop=SortPopulation(pop, 0);

        % Truncate
        pop=pop(1:nPop);


        % Non-Dominated Sorting
        [pop, F]=NonDominatedSorting(pop);

        % Calculate Crowding Distance
        pop=CalcCrowdingDistance(pop,F);

        % Sort Population
        [pop, F]=SortPopulation(pop, 0);
    else
        % Jam
        rou = it / MaxIt * ( rouMax - rouMin) + rouMin;
        
        pop = CalcGDRegressDistance(pop, Info);
        pop = CalcFSorting(pop, rou);
        
        [pop, F]= SortPopulation(pop, 1);
        
        % Truncate
        pop = pop(1:nPop); 
        
        % Non-Dominated Sorting
        [pop, F]=NonDominatedSorting(pop);
        
        % Calculate Crowding Distance
        pop=CalcCrowdingDistance(pop,F);
        
        pop = CalcGDRegressDistance(pop, Info);
        pop = CalcFSorting(pop, rou);
        
        % Sort Population by new regulation 
        [pop, F]= SortPopulation(pop, 1);
    end
 
    % Store F1
    F1=pop(F{1});
     
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
    
    % Plot F1 Costs
    figure(1);
    PlotCosts(F1);
    pause(0.01);
    
end

%% Results
