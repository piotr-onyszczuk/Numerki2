function [res] = coefficients(h, f, fbis0, fbisn)
%funkcja liczy wartosci wspolczynnikow funkcji interpolujacej
%h - dlugosc kazdego z podprzedzialow na jaka podzielilismy [a,b]
%f - wartosci funkcji w wezlach
%fbis0 - wartosc drugiej pochodnej w pierwszym wezle
%fbisn - wartosc drugiej pochodnej w ostatnim wezle
f=f(:);
%generowanie macierzy trojdiagonalnej
n=length(f)-1;
matrix=diag([6 4*ones(1,n-1) 6])+diag([0 ones(1,n-1)],1)+diag([ones(1,n-1) 0],-1);
%korekta wektora f
f(1)=f(1)-h*h*fbis0/6;
f(n+1)=f(n+1)-h*h*fbisn/6;
%rozwiazanie macierzy
res=gausselim(matrix, f);
%obliczenie wspolczynnikow o indeksach "-1" i "n+1"
first=h*h*fbis0/6+2*res(1)-res(2);
last=h*h*fbisn/6+2*res(n+1)-res(n);
res=[first; res; last];
end