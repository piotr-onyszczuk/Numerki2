%test
%badanie metody interpolacji funkcjami sklejanymi kubicznymi dla funkcji
%fun na przedziale [a,b]
a=2;
b=10;
fun=@(x)sin(x)+5;
%Jedno nalezy zakomentowac:
der2=@(x)-sin(x); %1: pochodna wyznaczona recznie, analitycznie
%der1=@(x)derivative(fun, x);  %2: pochodna liczona numerycznie
%der2=@(x)derivative(der1, x); %   numeryczna 2. pochodna
%wartosc pochodnej w a i b
da=der2(a);
db=der2(b);

wykres1;
wykres2;
wykres3;