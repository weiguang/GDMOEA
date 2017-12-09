function Indicator = Analysis(Pop,Info)
% Analysis the result
    PF = load(Info.PF);
    Costs=[Pop.Cost];
%% draw PF
    hold on;
    PlotPF(PF);
    hold off;
   
%% calculate GD
   GD = CalculateGD(PF,Costs');
%% calculate IGD
   IGD = CalculateIGD(PF,Costs');
 
%% for return
   Indicator.GD = GD;
   Indicator.IGD = IGD;
%% display
    fprintf("GD=%f, IGD=%f\n", GD, IGD);
end