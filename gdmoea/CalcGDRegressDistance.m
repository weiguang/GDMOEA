%%
% Auther : Jam
% E-mail : weiguang978@163.com
% 根据个体的分布，模拟出一个近似的前沿形状
% 然后计算个体到标准形状的距离
%

function [pop]=CalcGDRegressDistance(pop, Info)
    %多维
    nVar = Info.nVar;
    %种群大小
    nPop = Info.nPop;
    %聚类数
    k = Info.k;
    %聚类
    tcell = struct2cell(pop);
    Position = cell2mat( tcell(1,:)');
    [idx C] = kmeans(Position,k);
    
    tpop = [];%zeros(nPop, nVar);
    distance = zeros(nPop, 1);
    temp = 1;
    dis = 0;
    pop(1).GDistion = 0;
    %% 每个聚类进行回归分析
    for i = 1:k
        % %获取第i类种群
        pop_cluster =  pop(idx == i);
        cPosition =  Position(idx == i,1:nVar);
        csize = size(pop_cluster);
       %% 求多元线性回归
         %  y = 1 * kb + a *x1 + b * x2 +..., 构造 [1,a,b,...] 
        X = [ones(csize(1),1) cPosition(:,1:nVar-1)];
         % y = cPosition(:,nVar);
        [b,bint,r,rint,stats] = regress(cPosition(:,nVar), X);
        %% 计算点到形状的距离
        B = [b ; -1];
        dis = abs([ones(csize(1),1), cPosition] * B)/ sqrt( sum(b(2:nVar) .^2) );
        %% 拼接整合每一类的距离和种群
        %distance(temp:temp + csize(1) - 1) = dis;
        %给每个个体的记录赋值
        b = num2cell(dis);
        [pop(idx == i).GDistion]  = deal(b{:});
        %记录已经处理到个体数+1
        %temp = temp + csize(1); 
    end
    %% 根据计算的世代距离排序 
%     [~, GDSO]=sort([pop.GDistion]);
%     pop=pop(GDSO)
end