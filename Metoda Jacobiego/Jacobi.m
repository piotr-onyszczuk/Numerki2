function [eigenvalues] = Jacobi(A,eps,iter)
%funkcja zwraca wektor eigenvalues wartosci wlasnych macierzy A obliczony
%metoda Jacobiego
%
%Parametry:
%   A - macierz symetryczna
%   eps - dokladnosc obliczen (konczymy gdy miara odchylenia macierzy A od
%         macierzy diagonalnej jest mniejsza niz eps)
%   iter - ograniczenie na liczbe iteracji petli while

%uzupelnienie brakujacych parametrow

if nargin<3 || isempty(iter)
   iter = 1e6; 
end

if nargin<2 || isempty(eps)
    eps=1e-8;
end


%obliczenie poczatkowej miary odchylenia
deviation=calculate_deviation(A);
%rozmiar macierzy
n=length(A);

N=n*(n-1)/2;
i=1;

while deviation>eps && i<iter
    for i=1:(n-1)
        for j=(i+1):n
            if A(i,j)^2>=(deviation/N)
                deviation=deviation-A(i,j)^2;
                O=rotation_matrix(A,i,j);
                A=O'*A*O;
            end
        end
    end
    i=i+1;
end

%zwrocenie diagonali macierzy
eigenvalues=diag(A);

end