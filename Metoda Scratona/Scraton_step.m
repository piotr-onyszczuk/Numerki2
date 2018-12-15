function [k1,k3,k4,k5]=Scraton_step(xi,yi,h,f)
%funkcja obliczajaca wartosc funkcji bedacej rozwiazaniem rownania
%rozniczkowego w x(i+1) znajac (x(i),y(i)) metoda Scratona
% 
%Parametry: 
%   xi,yi - obliczone wczesniej wspolrzedne poprzedniego punktu
%   h - odleglosc na OX pomiedzy kolejnymi punktami
%   f - funkcja bedaca prawa strona rownania rozniczkowego
k1=h*f(xi,yi);
k2=h*f(xi+2*h/9,yi+2*k1/9);
k3=h*f(xi+h/3,yi+(k1+3*k2)/12);
k4=h*f(xi+3*h/4,yi+3*(23*k1-81*k2+90*k3)/128);
k5=h*f(xi+9*h/10,yi+9*(-345*k1+2025*k2-1224*k3+544*k4)/10000);
end