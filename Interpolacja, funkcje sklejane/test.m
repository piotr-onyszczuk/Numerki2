%test
a=0;
b=100;
fun=@(x)x.^2-12.*x;
%Jedno należy zakomentować:
der2=@(x) 2; %1: pochodna wyznaczona ręcznie, analitycznie
%der1=@(x)derivative(fun, x);  %2: pochodna liczona numerycznie
%der2=@(x)derivative(der1, x); %   numeryczna 2. pochodna
%value of derivative in a and b
da=der2(a);
db=der2(b);

subplot(2,1,1);
wykres1;
subplot(2,2,3);
wykres2;
subplot(2,2,4);
wykres3;