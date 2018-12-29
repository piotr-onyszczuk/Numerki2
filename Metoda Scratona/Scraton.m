function [] = Scraton(x,ya,f,y)
%funkcja rozwiazuje zagadnienie poczatkowe y'=f(x,y), ya=y(x(1)) podajac 
%wartosci funkcji w argumentach z wektora x
%
%Parametry;
%   x - wektor kolejnych argumentow dla ktorych liczone beda wartosci
%   funkcji y
%   ya - zagadnienie poczatkowe y(x(1))
%   f - prawa strona rownania (patrz opis)
%   y - funkcja bedaca rozwiazaniem rownania, sluzy do sprawdzania
%   poprawnosci wynikow (mozna nie podawac)


n=length(x)-1;
values=zeros(1,n+1);
values(1)=ya;
coefficients = [1445, 0, 6561, 3264, 2500];
coefficients_sum=sum(coefficients);

for i=1:n
   %obliczenie wartosci w kolejnym punkcie
   %[k1,k3,k4,k5]=Scraton_step(x(i),values(i),x(i+1)-x(i),f);
   %values(i+1)=values(i)+(1445*k1+6561*k3+3264*k4+2500*k5)/13770;
   k=Scraton_step(x(i),values(i),x(i+1)-x(i),f);
   values(i+1)=values(i)+(coefficients*k')/coefficients_sum;
end


%rysowanie wykresu
if (nargin==3 || isempty(y))
    plot(x,values,'.');
    legend('wynik metody');
    xlabel('x');
    ylabel('y');
else
    plot(x,values,'.',x,y(x), x, values-y(x));
    legend('wynik metody','rozwiazanie poprawne');
    xlabel('x');
    ylabel('y');
end


end

