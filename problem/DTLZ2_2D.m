function [y] = DTLZ2_2D(x)
% Objective function : Test problem 'DTLZ2'.
%*************************************************************************
% Minimize
 
obj = 2;

y = zeros(obj,1);
cons = [];
 
g = sum((x(obj:end)-0.5).^2);
 
x = x*pi/2;
 
% y(2)
t = 1 + g;
y(2) = t * sin(x(1));
% y(1)
y(1) = t * cos( x(1) );
