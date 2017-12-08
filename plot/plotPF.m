function plotPF(PF)
% plot 2D or 3D PF
%
    varSize = size(PF,2);
    if varSize <= 3
        if varSize == 2
            %scatter(PF(:,1),PF(:,2))
            plot(PF(:,1),PF(:,2),'bo','MarkerSize',6);
        elseif varSize == 3
             %scatter3(PF(:,1),PF(:,2),PF(:,3))
              plot3(PF(:,1),PF(:,2),PF(:,3),'bo','MarkerSize',6);
              zlabel('3^{nd} Objective');
        end
        xlabel('1^{st} Objective');
        ylabel('2^{nd} Objective');
        title('Non-dominated Solutions (F_{1})');
    else
        disp('Object size more than 3!')     
    end  
end