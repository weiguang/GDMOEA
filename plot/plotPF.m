function plotPF(PF)
% plot 2D or 3D PF
%
    varSize = size(PF,2)
    if varSize == 2
        scatter(PF(:,1),PF(:,2))
    elseif varSize == 3
         scatter3(PF(:,1),PF(:,2),PF(:,3))
    else
        disp('Object size more than 3!')     
    end  
end