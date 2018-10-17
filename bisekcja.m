function [convergent, bisectionroot] = bisekcja(poly,eps)
bisectionroot=0;
convergent=false;
%pierwsze przyblizenie
x0=-poly(2)/poly(1); 
%stopien nieparzysty
if (mod(length(poly),2)==0) 
    %miejsce zerowe jest na lewo od x0
    if polyval(poly,x0)*poly(1)>0 
        right=x0;
        %a - co ile odsuwamy sie od x0 szukaj¹c miejsca z przeciwnym
        %znakiem
        a=10;
        left=x0-a;
        %szukamy miejsca z przeciwnym znakiem
        while polyval(poly,left)*poly(1)>0 
            left=left-a;
        end
    %miejsce zerowe jest na prawo od x0
    else 
        %a - co ile odsuwamy sie od x0 szukaj¹c miejsca z przeciwnym
        %znakiem
        a=10;
        left=x0;
        right=x0+a;
        while polyval(poly,right)*poly(1)<0
            right=right+a;
        end
    end

%stopien parzysty
else
    %zaczynamy poszukiwania na lewo od x0 (N- jak daleko od x0)
    N=100;
    left=x0-N; 
    %bedziemy przesuwac sie o h
    h=0.5; 
    right=left+h;
    while polyval(poly,left)*polyval(poly,right)>0 && left<x0+100
        left=left+h;
        right=right+h;
    end
end

%sprawdzenie czy znalezlismy odpowiedni przedzial
if polyval(poly,left)*polyval(poly,right)>0 
    return;
end

middle=(left+right)/2;
%bisekcja
while abs(polyval(poly,middle))>eps
    if polyval(poly,middle)*polyval(poly,right)>0
        if right==middle
            return;
        end
        right=middle;
    else
        if left==middle
            return;
        end
        left=middle;
    end
    middle=(left+right)/2;
end
bisectionroot=middle;
convergent=true;
end