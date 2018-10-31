%wykres interpolacji funkcji fun przy uzyciu n rownoodleglych wezlow,
%wartosci sa liczone w n2 punktach
n=80;
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
subplot(2,2,1);
plot(x,fun(x),x,vals);
grid on;
title('Interpolacja funkcji');
xlabel('x');
ylabel('y');
legend('f(x)','interpolacja');