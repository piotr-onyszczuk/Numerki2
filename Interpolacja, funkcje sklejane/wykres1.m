grid on;

n=10;
n2=1000;
x=linspace(a,b,n);
h=(b-a)/(n-1);
f=fun(x);
coefs=coefficients(h,f,da,db);

x=linspace(a,b,n2);
vals=values(a,h,coefs,x);
f=fun(x);
plot(x,fun(x),x,vals);
title('Interpolacja funkcji na 10 wezlach');
xlabel('x');
ylabel('y');
legend('f(x)','interpolacja');