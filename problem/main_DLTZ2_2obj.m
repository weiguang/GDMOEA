% Weiguang Chen
% Contact Info: chen2621978@163.com
%
%

clc;
clear;
close all;

%% Problem Definition
CostFunction=@(x) DTLZ2_objfun_2obj(x);      % Cost Function % ���������
nVar= 11;             % Number of Decision Variables %�Ա�������,n=(M-1)+k
VarMin= 0;          % Lower Bound of Variables %�Ա���������
VarMax= 1;          % Upper Bound of Variables %�Ա���������
VarSize=[1 nVar];   % Size of Decision Variables Matrix
% Number of Objective Functions,10 obj
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));

%% Parameters Setting

MaxIt = 200;      % Maximum Number of Iterations
nPop = 50;        % Population Size

Info.CostFunction = CostFunction;   % Cost Function % ���������
Info.nVar = nVar;                    % Number of Decision Variables %�Ա�������,ά��
Info.VarMin = VarMin;               % Lower Bound of Variables %�Ա���������
Info.VarMax = VarMax;                % Upper Bound of Variables %�Ա���������
Info.nObj = nObj;                    % Number of Objective Functions
Info.k = 4;                         %cluster %������
Info.nPop = nPop;                   % Population Size %��Ⱥ����
Info.MaxIt = MaxIt;                  % Maximum Number of Iterations %��������

%% Gdmoea
Result=Gdmoea(Info);