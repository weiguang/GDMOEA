%
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

function PlotCosts(pop)

    Costs=[pop.Cost];
    m = size(Costs,1);
    if m <= 3

        grid on;
        if m == 2
            plot(Costs(1,:),Costs(2,:),'r*','MarkerSize',8);
        else
            plot3(Costs(1,:),Costs(2,:),Costs(2,:),'r*','MarkerSize',8);
            zlabel('3^{nd} Objective');
        end
        xlabel('1^{st} Objective');
        ylabel('2^{nd} Objective');
        title('Non-dominated Solutions (F_{1})');
    else
        disp('Object more than 3!');
    end 
end