%%
% Auther : Jam
% E-mail : weiguang978@163.com
% 计算全排序的值
%

function [pop] = CalcFSorting(pop, rou)
    if rou < 0 && rou >1
        rou = 0.6;
    end
    
    minGDistion = min([pop.GDistion]);
    temp = max( [pop.GDistion]) - minGDistion;
    newGDistion = 1 - ([pop.GDistion] - minGDistion) / temp;
    
    b = num2cell((1 - rou) * newGDistion + rou * [pop.CrowdingDistance]);
    [pop.FSorting] = deal(b{:});
    
end