function [] = Scraton(a,b,n,ya,f,y)
%funkcja rozwiazuje zagadnienie poczatkowe y'=f(x,y), fa=y(a) podajac 
%wartosci funkcji w n+1 rownoodleglych punktach na przedziale [a,b]
%
%Parametry;
%   a, b - konce przedzialu
%   n - liczba punktow dla ktorych liczona bedzie wartosc funkcji y
%   ya - zagadnienie poczatkowe y(a)
%   f - prawa strona rownania (patrz opis)
%   y - funkcja bedaca rozwiazaniem rownania, sluzy do sprawdzania
%   poprawnosci wynikow (mozna nie podawac)

x=zeros(1,n+1);
values=zeros(1,n+1);
x(1)=a;
values(1)=ya;
h=(b-a)/n;

for i=1:n
   x(i+1)=x(i)+h;
   %obliczenie wartosci w kolejnym punkcie
   [k1,k3,k4,k5]=Scraton_step(x(i),values(i),h,f);
   values(i+1)=values(i)+(1445*k1+6561*k3+3264*k4+2500*k5)/13770;
end


%rysowanie wykresu
if (isempty(y) || nargin==5)
    plot(x,values,'.');
    legend('wynik metody');
    xlabel('x');
    ylabel('y');
else
    plot(x,values,'.',x,y(x));
    legend('wynik metody','rozwiazanie poprawne');
    xlabel('x');
    ylabel('y');
end


end

