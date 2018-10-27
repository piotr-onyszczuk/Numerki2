function [x] = gausselim(A, b)
%MELIMINATION Summary of this function goes here
%   Detailed explanation goes here
Ab=[A b];
n=size(A, 1);
Ab(1, :)=Ab(1, :)/Ab(1, 1);
Ab(2, :)=Ab(2, :)-Ab(1, :).*Ab(2,1);
for i=2:n-1
    Ab(i, i:end)=Ab(i, i:end)/Ab(i, i);
    Ab(1:i-1, i:end)=Ab(1:i-1, i:end)-Ab(i, i:end).*Ab(1:i-1, i);
    Ab(i+1, i:end)=Ab(i+1, i:end)-Ab(i, i:end).*Ab(i+1, i);
end
Ab(n, n:end)=Ab(n, n:end)/Ab(n, n);
Ab(1:n-1, n:end)=Ab(1:n-1, n:end)-Ab(n, n:end).*Ab(1:n-1, n);
x=Ab(:, end);
end