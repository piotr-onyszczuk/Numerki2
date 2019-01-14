function [res] = values(a,h,coefficients,x)
%funkcja liczy wartosci funkcji interpolujacej w punktach z wektora "x"
%a - poczatek przedzialu w ktorym interpolujemy
%h - dlugosc kazdego z podprzedzialow na jaka podzielilismy [a,b]
%coefficients - wartosci wspolczynnikow funkcji interpolujacej

res=zeros(size(x));
tmp=x-a;
indexes=floor(tmp/h)+2;
%wiemy ze kazdy x jest w przedziale [left, right)
d_left=mod(tmp,h);
d_right=h-d_left;
n=length(coefficients);
coefficients(n+1)=0;
coefficients=coefficients';

%obliczanie wartosci w punktach
res=res+(coefficients(indexes-1)).*(d_right.^3);
res=res+(coefficients(indexes)).*(h^3+3*h*h*d_right+3*h*(d_right.^2)-3*(d_right.^3));
res=res+(coefficients(indexes+1)).*(h^3+3*h*h*d_left+3*h*(d_left.^2)-3*(d_left.^3));
res=res+(coefficients(indexes+2)).*(d_left.^3);
res=res/(h^3);
    
end
