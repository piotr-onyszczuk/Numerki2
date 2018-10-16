function [res] = Bairstow(poly, x0, eps, eps2, iter, nomultiples)
% BAIRSTOW znajduje miejsca zerowe wielomianu metodą Bairstowa
% BAIRSTOW wyznacza rzeczywiste oraz zespolone miejsca zerowe wielomianów
% stopnia >=3 metodą Bairstowa, tj. przez poszukiwanie trójmianu kw.
% t^2-pt-q który dzieli zadany wielomian z najmniejszą resztą. Poszukiwanie
% odbywa się przez zastosowanie dwuwymiarowej metody Newtona względem
% parametrów p i q.
% poly - wielomian, wektor współczynników przy potęgach w kolejności
% malejącej, poly(1)!=0
% x0 - początkowe współczynniki w trójmianie kw. przez który dzielimy
% wielomian poly tzn. t^2-epspt-q=t^2-x0(1)*t-x0(2)
% eps - dokładność wyników, jeśli norma 2 ze współczynników (poza 1) w
% trójmianie kwadratowym jest mniejsza od eps to przyjmujemy, że ten
% trójmian jest dzielnikiem wielomianu
% eps2 - analogicznie jak eps, służy jednak eliminacji wielokrotnych zer
% wielomianu. Jeśli nomultiples != true to eps2 nie jest istotny
% iter - maksymalna ilość iteracji w głównej pętli metody, licznik zerowany
% po znalezieniu nowego miejsca zerowego
% nomultiples - zmienna logiczna, której wartość odpowiada na pytanie: czy
% powtarzające się zera wielomianu powinny być zredukowane do jednego
% wystąpienia w wektorze wyników
% argumenty konieczne: poly, x0. W miejsce parametrów pominiętych należy
% umieścić "[]" (pusty wektor).

% Jeśli parametry nie zostały przekazane to ustawiamy domyślne
if isempty(eps)
    eps=1e-9;
end
if isempty(eps2)
    eps2=1e-4;
end
if isempty(iter)
    iter=100;
end
if isempty(nomultiples)
    nomultiples=false;
end
% ukrywamy ostrzeżenia, które są przez program wyłapywane
warning('off', 'MATLAB:singularMatrix')
warning('off', 'MATLAB:illConditionedMatrix')
% Ustawiamy wektory początkowe
x = x0(:);
poly = poly(:);
res=[];
quadratic=[1; -x];
convergent=true;
while length(poly)>3 && convergent
    i=1;
    [poly1, remainder] = deconv(poly, quadratic);
    remainder=remainder(end-1:end); % ostatnie dwa elementy reszty
    while norm(remainder)>eps &&  i<=iter
        [~,AB1]=deconv(poly1, quadratic);
        AB1=AB1(end-1:end);
        A1=AB1(1);
        B1=AB1(2);
        Ar=x(1)*A1+B1;
        Br=x(2)*A1;
        x=x-[Ar, A1; Br, B1]\remainder;
        [~, warn]=lastwarn;
        if isequal(warn, 'MATLAB:singularMatrix') || isequal(warn, 'MATLAB:illConditionedMatrix')
            % W przypadku wystąpienia osobliwej(lub niemal osobliwej) 
            % macierzy Jacobiego symulujemy przekroczenie dozwolonej ilosci
            % iteracji
            i=iter+1;
            lastwarn('');
        end
        quadratic=[1; -x];
        [poly1, remainder] = deconv(poly, quadratic);
        remainder=remainder(end-1:end); % ostatnie dwa elementy reszty
        i=i+1;
    end
    if i>iter 
        % W przypadku niepowodzenia metody Bairstowa używamy metody
        % bisekcji
        [convergent, bisectionroot]=bisekcja(poly, eps);
        if convergent 
            % jezeli bisekcja zwróciła poprawny wynik, dodajemy go do
            % wektora wynikowego. W przeciwnym przypadku zakończymy
            % działanie programu
            res=[bisectionroot; res];
            poly=deconv(poly, [1 -bisectionroot]);
            if nomultiples
                while abs(polyval(poly, bisectionroot))<eps2 && length(poly)>=2
                    % eliminujemy zera wielokrotne wielomianu poly
                    poly=deconv(poly, [1 ; -bisectionroot]);
                end
            end
        else
            break
        end
        x=x0(:);
        quadratic=[1; -x];
    else
        % za pomocą roots znajdujemy miejsca zerowe wielomianu kwadratowego
        % znalezionego metodą Bairstowa
        quadraticroots=roots(quadratic);
        if nomultiples && abs(quadratic(2)^2-4*quadratic(1)*quadratic(3))<eps2
            res=[real(quadraticroots(1)); res];
        else
            res=[quadraticroots; res];
        end
        [poly, ~]=deconv(poly, quadratic);
        %eliminujemy zera wielokrotne
        if nomultiples
            if quadratic(2)^2-4*quadratic(1)*quadratic(3) <= 0
                [~,remainder]=deconv(poly,quadratic);
                while norm(remainder)<eps2 && length(poly)>=3
                    [poly, ~]=deconv(poly, quadratic);
                    [~,remainder]=deconv(poly,quadratic);
                end
            else
                while abs(polyval(poly, quadraticroots(1)))<eps2 && length(poly)>=2
                    poly=deconv(poly, [1 -quadraticroots(1)]);
                end
                while abs(polyval(poly, quadraticroots(2)))<eps2 && length(poly)>=2
                    poly=deconv(poly, [1 -quadraticroots(2)]);
                end
            end
        end
    end
end
if ~convergent
    fprintf("Nie znaleziono wszystkich pierwiastków wielomianu. Zastosowanie innych parametrów początkowych może pomóc.");
end
if nomultiples && length(poly)==3
     quadraticroots=roots(poly);
        if abs(quadratic(2)^2-4*quadratic(1)*quadratic(3))<eps2
            res=[real(quadraticroots(1)); res];
        else
            res=[quadraticroots; res];
        end
else if length(poly)<=3
    res=[roots(poly); res];
end
end