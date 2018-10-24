%Error of the method
x0=[0, 0];
min_root=3;
max_root=10;
results=zeros(max_root-min_root+1, 2);

for i=min_root:max_root
    p=poly(1:i);
    results(i-min_root+1, 1)=sum(abs(polyval(p, Bairstow(p, x0, [], [], [], []))))/i;
    results(i-min_root+1, 2)=sum(abs(polyval(p, roots(p))))/i;
end
subplot(2, 2, 1)
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('Średni błąd (poly(1:n))')
ylabel('Średni błąd')
xlabel('Stopień wielomianu (n)')
legend('Bairstow', 'roots')
axis([min_root max_root -inf inf])
axis('auto y')
%Time needed
for i=min_root:max_root
    p=poly(1:i);
    p;
    f=@() Bairstow(p, x0, [], [], [], []);
    results(i-min_root+1, 1)=timeit(f);
    f=@() roots(p);
    results(i-min_root+1, 2)=timeit(f);
end
subplot(2, 2, 2)
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('Czas wykonania (poly(1:n))')
ylabel('Czas [s]')
xlabel('Stopień wielomianu (n)')
legend('Bairstow', 'roots')
axis([min_root max_root -inf inf])
axis('auto y')
%And now for something completely complex
%LARCH
min_root=3;
max_root=16;
results=zeros(max_root-min_root+1, 2);
for i=min_root:max_root
    p=[1 zeros(1, i-1) -1];
    results(i-min_root+1, 1)=sum(abs(polyval(p, Bairstow(p, x0, [], [], [], []))))/i;
    results(i-min_root+1, 2)=sum(abs(polyval(p, roots(p))))/i;
end
subplot(2, 2, 3)
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('Średni błąd (x^n-1)')
ylabel('Średni błąd')
xlabel('Stopień wielomianu (n)')
legend('Bairstow', 'roots')
axis([min_root max_root -inf inf])
axis('auto y')
%Time needed
for i=min_root:max_root
    p=[1 zeros(1, i-1) -1];
    f=@() Bairstow(p, x0, [], [], [], []);
    results(i-min_root+1, 1)=timeit(f);
    f=@() roots(p);
    results(i-min_root+1, 2)=timeit(f);
end
subplot(2, 2, 4)
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('Czas wykonania (x^n-1)')
ylabel('Czas [s]')
xlabel('Stopień wielomianu (n)')
legend('Bairstow', 'roots')
axis([min_root max_root -inf inf])
axis('auto y')
%----------------------------