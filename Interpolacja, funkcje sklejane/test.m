%test
a=0;
b=100;
n=100;
n2=213;
fun=@(x)x.^6-12.*x.^4;
x=linspace(a,b,n);
f=fun(x);
f=f(:);
h=(b-a)/(n-1);
fbis0=0;
fbisn=0;
coefs=coefficients(h,f,fbis0,fbisn);
y=linspace(a,b,n2);
y=y(:);
vals=values(a,h,coefs,y);

plot(y,vals,x,f)