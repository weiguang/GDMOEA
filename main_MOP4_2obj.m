% Weiguang Chen
% Contact Info: chen2621978@163.com
%
%

clc;
clear;
close all;

%% Problem Definition
CostFunction=@(x) MOP4(x);      % Cost Function % 解决的问题
nVar= 3;             % Number of Decision Variables %自变量个数,1-3
VarMin= -5;          % Lower Bound of Variables %自变量的下限
VarMax= 5;          % Upper Bound of Variables %自变量的上限
VarSize=[1 nVar];   % Size of Decision Variables Matrix
% Number of Objective Functions,2 object
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));

%% Parameters Setting

MaxIt = 200;      % Maximum Number of Iterations
nPop = 100;        % Population Size

Info.CostFunction = CostFunction;   % Cost Function % 解决的问题
Info.nVar = nVar;                    % Number of Decision Variables %自变量个数,维度
Info.VarMin = VarMin;               % Lower Bound of Variables %自变量的下限
Info.VarMax = VarMax;                % Upper Bound of Variables %自变量的上限
Info.nObj = nObj;                    % Number of Objective Functions
Info.k = 4;                         %cluster %聚类数
Info.nPop = nPop;                   % Population Size %种群数量
Info.MaxIt = MaxIt;                  % Maximum Number of Iterations %迭代次数

%% Gdmoea
Gdmoea(Info);