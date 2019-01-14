function [matrix] = rotation_matrix(A,p,q)
%funkcja zwraca macierz obrotu O_{p,q} o kat phi
%
%Parametry:
%   A - macierz obracana
%   p,q - parametry opisujace macierz obrotu


%obliczenie wspolczynnikow obrotu
beta=(A(q,q)-A(p,p))/(2*A(p,q));
t=sign(beta)/(abs(beta)+sqrt(1+beta^2)); %tg(phi)
c=1/sqrt(1+t^2); %cos(phi)
s=t*c; %sin(phi)

%generowanie macierzy diagonalnej
matrix=ones(size(A));
matrix=diag(diag(matrix));

%modyfikacja macierzy diagonalnej do macierzy obrotu Givensa
matrix(p,p)=c;
matrix(p,q)=s;
matrix(q,p)=-s;
matrix(q,q)=c;
end