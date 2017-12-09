function [y] = DTLZ2_8D(x)
% Objective function : Test problem 'DTLZ2'.
%*************************************************************************
% Minimize
 
obj = 8;
y = zeros(obj,1);
cons = [];
 
g = sum((x(obj:end)-0.5).^2);
 
x = x*pi/2;
 
%y(obj)
t = 1 + g;
y(obj) = t * sin(x(1));
 
% y(obj) - y(2)
if obj > 2
    for i = (obj-1):-1:2
        t = t * cos( x(obj-i) );
        y(i) = t * sin( x(obj-i+1) );
    end
end
 
% y(1)
y(1) = t * cos( x(obj-1) );