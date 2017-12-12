function [y] = DTLZ2_3D(x)
% Objective function : Test problem 'DTLZ2'.
%*************************************************************************
% Minimize
 
obj = 3;

y = zeros(obj,1);

cons = [];

g = sum((x(3:end)-0.5).^2);

y(1) = (1+g) * cos(x(1)*pi/2) * cos(x(2)*pi/2);
y(2) = (1+g) * cos(x(1)*pi/2) * sin(x(2)*pi/2);
y(3) = (1+g) * sin(x(1)*pi/2);

