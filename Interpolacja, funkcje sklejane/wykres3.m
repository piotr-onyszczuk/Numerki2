st=20; %poczatek badanego przedzialu iteracji
en=200; %koniec badanego przedzialu iteracji
n2=100000; %ilosc punktow w ktorych liczone sa wartosci
x0=linspace(a,b,n2);
f0=fun(x0);
j=st:en;
errors=zeros(1,n);
for i=j
    x=linspace(a,b,i);
    h=(b-a)/(i-1);
    f=fun(x);
    coefs=coefficients(h,f,da,db);
    vals=values(a,h,coefs,x0);
    errors(i)=norm(vals-f0);
end
semilogy(j,errors(j));
title('Błędy interpolacji');
xlabel('Liczba węzłów');
ylabel('Norma wektora błędów');