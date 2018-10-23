function [res] = values(a,h,coefficients,x)

res=zeros(size(x));
tmp=x-a;
indexes=floor(tmp/h)+2;
%x is in [left, right)
d_left=mod(tmp,h);
d_right=h-d_left;
n=length(coefficients);
coefficients(n+1)=0;
coefficients=coefficients';

res=res+(coefficients(indexes-1)).*(d_right.^3);
res=res+(coefficients(indexes)).*(h^3+3*h*h*d_right+3*h*(d_right.^2)-3*(d_right.^3));
res=res+(coefficients(indexes+1)).*(h^3+3*h*h*d_left+3*h*(d_left.^2)-3*(d_left.^3));
res=res+(coefficients(indexes+2)).*(d_left.^3);
res=res/(h^3);
    
end
