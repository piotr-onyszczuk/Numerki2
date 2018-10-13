function [res] = Bairstow(poly, x0, eps, tol, iter)
% BAIRSTOW finds all roots of a polynomial using Bairstow's method
%
% Syntax: function = Bairstow(coef, x0)
%
% Long description
x0 = x0(:);
poly = poly(:);
res=[];
quadratic=[1; -x0(:)];
root=roots(quadratic);
while(length(poly)>3)
    i=1;
    while polyval(poly,root(1))>eps &&  i<iter
        [poly1, remainder] = deconv(poly, quadratic);
        remainder=remainder(end-1:end);
        [~,AB1]=deconv(poly1, quadratic);
        AB1=AB1(end-1:end);
        A1=AB1(1);
        B1=AB1(2);
        Ar=x0(1)*A1+B1;
        Br=x0(2)*A1;
        x0=x0-[Ar, A1; Br, B1]\remainder;
        quadratic=[1; -x0(:)];
        i=i+1;
    end
    if i>iter
        bisekcja(poly);
    end
    res=[roots([1; -x0(:)]);res];
    poly=deconv(poly, quadratic);
end
res = [roots(poly);res];
end