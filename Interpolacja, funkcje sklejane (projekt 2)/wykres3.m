%wyznaczanie normy wektora bledow w zaleznosci od ilosci wezlow uzytych do
%interpolacji funkcji

st=20; %poczatek badanego przedzialu ilosci wezlow
en=200; %koniec ww przedzialu
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

%wykres
subplot(2,2,4);
semilogy(j,errors(j),'.r');
grid on;
title('Bledy interpolacji');
xlabel('Liczba wezlow');
ylabel('Norma wektora bledow');