function [res] = coefficients(h, f, fbis0, fbisn)
% tmp=size(f);
% if tmp(1)==1
%     f=f(:);
% end
f=f(:);
n=length(f)-1;
matrix=diag([6 4*ones(1,n-1) 6])+diag([0 ones(1,n-1)],1)+diag([ones(1,n-1) 0],-1);
f(1)=f(1)-h*h*fbis0/6;
f(n+1)=f(n+1)-h*h*fbisn/6;
%res=matrix\f;
res=melimination(matrix, f);
first=h*h*fbis0/6+2*res(1)-res(2);
last=h*h*fbisn/6+2*res(n+1)-res(n);
res=[first; res; last];
end