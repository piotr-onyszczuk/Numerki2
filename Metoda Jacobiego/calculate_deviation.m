function [deviation] = calculate_deviation(A)
%funkcja liczy miare odchylenia symetrycznej macierzy A od macierzy 
%diagonalnej jako polowe sumy kwadratow elementow pozadiagonalnych
%
%Parametry:
%   A - macierz symetryczna

deviation=0;
n=length(A);

for i=1:(n-1)
    for j=(i+1):n
        deviation=deviation+A(i,j)^2;
    end
end

end