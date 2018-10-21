%Error of the method
x0=[0, 0];
min_root=4;
max_root=10;
results=zeros(max_root-min_root+1, 2);
for i=min_root:max_root
    p=poly(1:i);
    results(i-min_root+1, 1)=sum(abs(polyval(p, Bairstow(p, x0, 1e-9, [], [], []))))/i;
    results(i-min_root+1, 2)=sum(abs(polyval(p, roots(p))))/i;
end
figure
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('poly error')
legend('Bairstow', 'roots')
%Time needed
for i=min_root:max_root
    p=poly(1:i);
    f=@() Bairstow(p, x0, [], [], [], []);
    results(i-min_root+1, 1)=timeit(f);
    f=@() roots(p);
    results(i-min_root+1, 2)=timeit(f);
end
figure
semilogy(min_root:max_root, results(:, 1), min_root:max_root, results(:, 2))
title('time')
legend('Bairstow', 'roots')