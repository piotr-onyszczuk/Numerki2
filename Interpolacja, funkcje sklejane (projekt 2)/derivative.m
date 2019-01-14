function [x] = derivative(f, x, h)
%DERIVATIVE Numerycznie przybliża pochodną funkcji f w punktach x
%   f - wskaźnik do funkcji
%   x - punkty, w których ma być obliczona pochodna
%   h - paramatr opcjonalny
%   wg. definicji pochodnej: f'(x)=lim(h->0)(f(x+h)-f(x))/h, zatem funkcja
%   derivative zwracająca (f(x+h)-f(x-h))/2*h może być dobrym przybliżeniem
%   pochodnej. Przyjmujemy, że f zwraca poprawne wyniki dla argumentów w
%   pewnym (+-h) otoczeniu punktów z wektora x.
if nargin==2
    h=1e-3;
end
x=(f(x+h)-f(x-h))./(2*h);
end

