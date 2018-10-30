%test
%badanie metody interpolacji funkcjami sklejanymi kubicznymi dla funkcji
%fun na przedziale [a,b]
a=2;
b=100;
fun=@(x)log(x);
%Jedno nalezy zakomentowac:
der2=@(x) -1/(x^2); %1: pochodna wyznaczona recznie, analitycznie
%der1=@(x)derivative(fun, x);  %2: pochodna liczona numerycznie
%der2=@(x)derivative(der1, x); %   numeryczna 2. pochodna
%wartosc pochodnej w a i b
da=der2(a);
db=der2(b);

subplot(2,1,1);
wykres1;
subplot(2,2,3);
wykres2;
subplot(2,2,4);
wykres3;