%%
% Auther : Jam
% E-mail : weiguang978@163.com
% ���ݸ���ķֲ���ģ���һ�����Ƶ�ǰ����״
% Ȼ�������嵽��׼��״�ľ���
%

function [pop]=CalcGDRegressDistance(pop, Info)
    %��ά
    nVar = Info.nVar;
    %��Ⱥ��С
    nPop = Info.nPop;
    %������
    k = Info.k;
    %����
    tcell = struct2cell(pop);
    Position = cell2mat( tcell(1,:)');
    [idx C] = kmeans(Position,k);
    
    tpop = [];%zeros(nPop, nVar);
    distance = zeros(nPop, 1);
    temp = 1;
    dis = 0;
    pop(1).GDistion = 0;
    %% ÿ��������лع����
    for i = 1:k
        % %��ȡ��i����Ⱥ
        pop_cluster =  pop(idx == i);
        cPosition =  Position(idx == i,1:nVar);
        csize = size(pop_cluster);
       %% ���Ԫ���Իع�
         %  y = 1 * kb + a *x1 + b * x2 +..., ���� [1,a,b,...] 
        X = [ones(csize(1),1) cPosition(:,1:nVar-1)];
         % y = cPosition(:,nVar);
        [b,bint,r,rint,stats] = regress(cPosition(:,nVar), X);
        %% ����㵽��״�ľ���
        B = [b ; -1];
        dis = abs([ones(csize(1),1), cPosition] * B)/ sqrt( sum(b(2:nVar) .^2) );
        %% ƴ������ÿһ��ľ������Ⱥ
        %distance(temp:temp + csize(1) - 1) = dis;
        %��ÿ������ļ�¼��ֵ
        b = num2cell(dis);
        [pop(idx == i).GDistion]  = deal(b{:});
        %��¼�Ѿ�����������+1
        %temp = temp + csize(1); 
    end
    %% ���ݼ���������������� 
%     [~, GDSO]=sort([pop.GDistion]);
%     pop=pop(GDSO)
end