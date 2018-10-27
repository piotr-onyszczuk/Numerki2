function [x] = derivative(f, x, h)
%NUMERICAL_DERIVATIVE Summary of this function goes here
%   Detailed explanation goes here
if nargin==2
    h=1e-3;
end
x=(f(x+h)-f(x-h))./(2*h);
end

