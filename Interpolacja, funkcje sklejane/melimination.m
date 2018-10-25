function [x] = melimination(A, b)
%MELIMINATION Summary of this function goes here
%   Detailed explanation goes here
Ab=[A b];
n=size(A, 1);
for i=1:n
    Ab(i, i:end)=Ab(i, i:end)/Ab(i, i);
    Ab(1:i-1, i:end)=Ab(1:i-1, i:end)-Ab(i, i:end).*Ab(1:i-1, i);
    Ab(i+1:end, i:end)=Ab(i+1:end, i:end)-Ab(i, i:end).*Ab(i+1:end, i);
end
x=Ab(:, end);
end