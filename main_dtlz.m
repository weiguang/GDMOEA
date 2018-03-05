
clc
clear

%%
fname = 'dtlz2';
M = 2;

%% Gdmoea
Info = dtltSetting(fname, M);
Result=Gdmoea(Info);


function [Info] = dtltSetting(fname,M)
switch fname
   case 'dtlz1' %k = 5 and x(last) = 0.5
     k = 5;
    cluster  = 3;
      
   case 'dtlz2' %k = 10 and x(last) = 0.5
      k = 10;
      cluster  = 3;
      
   case 'dtlz3' %k = 10 and x(last) = 0.5
      k = 10;
      cluster  = 3;
  
   case 'dtlz4' %k = 10 and x(last) = 0.5
      k = 10;
          cluster  = 3;
     
   case 'dtlz5' %k = 10 and x(last) = 0.5
      k = 10;
      cluster  = 3;
     
   case 'dtlz6' %k = 10 and x(last) = 0
      k = 10;
      cluster  = 3;
     
   case 'dtlz7' %k = 20 and x(last) = 0
      k = 20;
      cluster  = 3;
    
end

    Info.varType = 1; %���Ϊ1����Ҫ�ڵ���֮ǰ�Ѹ����Ϊ������
    Info.CostFunction = fname;
    PF = sprintf("%s.%dD.pf",upper(fname),M)
    Info.PF = PF;             % Real pareto front %��ʵ��PF
    Info.nPop = 100;                   % Population Size %��Ⱥ����
    Info.MaxIt = 200;                  % Maximum Number of Iterations %��������
    Info.k = cluster;                         %cluster %������
    Info.nVar = (M - 1) + k;                    % Number of Decision Variables %�Ա�������,ά��
    Info.nObj = M;                    % Number of Objective Functions
    Info.VarMin = 0;               % Lower Bound of Variables %�Ա���������
    Info.VarMax = 1;                % Upper Bound of Variables %�Ա���������
    
end