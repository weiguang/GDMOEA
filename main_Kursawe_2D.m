% Developer: Weiguang Chen
% Contact Info: chen2621978@gmail.com
%
% Kursawe function
% Minimize

clc;
clear;
close all;

%% Problem Definition
CostFunction=@(x) Kursawe(x);      % Cost Function % ���������
nVar= 3;             % Number of Decision Variables %�Ա�������,1-3
VarMin= -5;          % Lower Bound of Variables %�Ա���������
VarMax= 5;          % Upper Bound of Variables %�Ա���������

VarSize=[1 nVar];   % Size of Decision Variables Matrix
% Number of Objective Functions,2 object
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));

%% Parameters Setting

MaxIt = 100;      % Maximum Number of Iterations
nPop = 50;        % Population Size

Info.CostFunction = CostFunction;   % Cost Function % ���������
Info.nVar = nVar;                    % Number of Decision Variables %�Ա�������,ά��
Info.VarMin = VarMin;               % Lower Bound of Variables %�Ա���������
Info.VarMax = VarMax;                % Upper Bound of Variables %�Ա���������
Info.nObj = nObj;                    % Number of Objective Functions
Info.k = 4;                         %cluster %������
Info.nPop = nPop;                   % Population Size %��Ⱥ����
Info.MaxIt = MaxIt;                  % Maximum Number of Iterations %��������
Info.PF = 'Kursawe.pf';              % Real pareto front %��ʵ��PF

%% Gdmoea
Gdmoea(Info);
