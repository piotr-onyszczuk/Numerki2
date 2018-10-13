function [res] = Bairstow(poly, x0, eps, iter)
% BAIRSTOW finds all roots of a polynomial using mainly Bairstow's method
%
% Syntax: function = Bairstow(coef, x0)
%
% Long description

% Jeśli parametry nie zostały przekazane to ustawiamy domyślne
if isempty(eps)
    eps=1e-6;
end
if isempty(iter)
    iter=100;
end
% Ustawiamy wektory początkowe
x0 = x0(:);
poly = poly(:);
res=[];
quadratic=[1; -x0];
root=roots(quadratic);
convergent=true;
while length(poly)>3 && convergent
    i=1;
    while polyval(poly,root(1))>eps &&  i<=iter
        [poly1, remainder] = deconv(poly, quadratic);
        remainder=remainder(end-1:end); % ostatnie dwa elementy reszty
        [~,AB1]=deconv(poly1, quadratic);
        AB1=AB1(end-1:end);
        A1=AB1(1);
        B1=AB1(2);
        Ar=x0(1)*A1+B1;
        Br=x0(2)*A1;
        x0=x0-[Ar, A1; Br, B1]\remainder;
        [~, warn]=lastwarn;
        if isequal(warn, 'MATLAB:singularMatrix')
            % W przypadku wystąpienia osobliwej macierzy Jacobiego
            % symulujemy przekroczenie dozwolonej ilosci iteracji
            i=iter+1;
            lastwarn('');
        end
        quadratic=[1; -x0];
        i=i+1;
        root=roots(quadratic);
    end
    if i>iter 
        % W przypadku niepowodzenia metody Bairstowa używamy metody
        % bisekcji
        [convergent, bisectionroot]=bisekcja(poly, eps);
        if convergent 
            % jezeli bisekcja zwróciła poprawny wynik, dodajemy go do
            % wektora wynikowego. W przeciwnym przypadku zakończymy
            % działanie programu
            res=[res; bisectionroot];
            while polyval(poly, bisectionroot)<eps
                % eliminujemy zera wielokrotne wielomianu poly
                poly=deconv(poly, [1 ; -bisectionroot]);
            end
        end
    else
        % za pomocą roots znajdujemy miejsca zerowe wielomianu kwadratowego
        % znalezionego metodą Bairstowa
        quadraticroots=roots([1; -x0]);
        res=[quadraticroots; res];
        poly=deconv(poly, quadratic);
        while polyval(poly, quadraticroots(1))<eps
            % eliminujemy zera wielokrotne wielomianu poly
            poly=deconv(poly, [1 ; -quadraticroots(1)]);
        end
        while polyval(poly, quadraticroots(2))<eps
            % eliminujemy zera wielokrotne wielomianu poly
            poly=deconv(poly, [1 ; -quadraticroots(2)]);
        end
    end
end
if ~convergent
    fprintf("Nie znaleziono wszystkich pierwiastków wielomianu");
end
if length(poly)<=3
    res=[roots(poly); res]
end