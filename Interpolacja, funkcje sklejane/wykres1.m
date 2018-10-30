%wykres interpolacji funkcji fun przy uzyciu 10 (n) rownoodleglych wezlow,
%wartosci sa liczone w n2 punktach
n=10;
n2=1000;
x=linspace(a,b,n);
h=(b-a)/(n-1);
f=fun(x); 
%wspolczynniki funkcji sklejanych
coefs=coefficients(h,f,da,db); 

x=linspace(a,b,n2);
%wartosci funkcji interpolowanej
f=fun(x);
%wartosci funkcji interpolujacej
vals=values(a,h,coefs,x);

%wykres
plot(x,fun(x),x,vals);
grid on;
title('Interpolacja funkcji na 10 wezlach');
xlabel('x');
ylabel('y');
legend('f(x)','interpolacja');