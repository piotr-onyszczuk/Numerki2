%test
a=0;
b=100;
fun=@(x)x.^2-12.*x;
%der=@(x)2.*x-12;
der=@(x) 2;
%der=@(x)derivative(fun, x);
%der=@(x)derivative(der, x);
%value of derivative in a and b
da=der(a);
db=der(b);

subplot(2,2,1);
wykres1;
subplot(2,2,2);
wykres2;
subplot(2,2,3);
wykres3;
subplot(2,2,4)
wykres4;