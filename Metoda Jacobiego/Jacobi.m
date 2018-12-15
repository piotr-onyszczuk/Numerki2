function [eigenvalues] = Jacobi(A,n,eps,iter,debug)
%funkcja zwraca wektor eigenvalues wartosci wlasnych macierzy A obliczony
%metoda Jacobiego
%
%Parametry:
%   A - macierz symetryczna
%   n - rozmiar losowanej macierzy symetrycznej, gdy A nie zostanie podana
%   eps - dokladnosc obliczen (konczymy gdy miara odchylenia macierzy A od
%         macierzy diagonalnej jest mniejsza niz eps)
%   iter - ograniczenie na liczbe iteracji petli while
%   debug - zmienna logiczna, ustawiona na true pozwala uzyskac dodatkowe
%          informacje dotyczace przebiegu funkcji

%uzupelnienie brakujacych parametrow

if nargin<5 || isempty(debug)
   debug=false; 
end

if nargin<4 || isempty(iter)
   iter = 1e6; 
end

if nargin<3 || isempty(eps)
    eps=1e-8;
end

if nargin<2 || isempty(n)
    n=100;
end

if isempty(A)
    A=sym_matrix(n);
end

%obliczenie poczatkowej miary odchylenia
deviation=calculate_deviation(A);
%rozmiar macierzy
n=length(A);


tmp=A;
N=n*(n-1)/2;
while_counter=1;
operations_counter=1;
itertab=[];
deviationtab=[];

tic;
while deviation>eps && while_counter<iter

    for i=1:(n-1)
        for j=(i+1):n
            if A(i,j)^2>=(deviation/N) && deviation>eps
                itertab=[itertab operations_counter];
                deviationtab=[deviationtab deviation];
                operations_counter=operations_counter+1;
                deviation=deviation-A(i,j)^2;
                O=rotation_matrix(A,i,j);
                A=O'*A*O;
            end
        end
    end
    while_counter=while_counter+1;
end
time=toc;
itertab=[itertab operations_counter];
deviationtab=[deviationtab deviation];


%zwrocenie diagonali macierzy
eigenvalues=sort(diag(A));

%debugowanie
if debug==true
    plot (itertab, deviationtab, '.');
    xlabel('liczba wykonanych obrotow');
    ylabel('odchylenie od macierzy diagonalnej');
    fprintf("Wykonano %d obrotow\n",operations_counter);
    fprintf("oraz %d przejsc po calej macierzy.\n",while_counter);
    fprintf("Funkcja wykonywala sie %d sekund.\n",time);
    tic;
    matlab_eigenvalues=sort(eig(tmp));
    matlab_time=toc;
    fprintf("Matlab liczy to samo %d sekund.\n",matlab_time);
    err=norm(eigenvalues-matlab_eigenvalues);
    fprintf("Norma z roznicy miedzy wektorami wynikowymi wynosi %d.\n",err);
end
    


end