function [convergent, bisectionroot] = bisekcja(poly,eps)

convergent=true;
%pierwsze przyblizenie
x0=-poly(2)/poly(1); 
%stopien nieparzysty
if (mod(length(poly),2)==0) 
    %miejsce zerowe jest na lewo od x0
    if polyval(poly,x0)*poly(1)>0 
        right=x0;
        left=x0-10;
        %szukamy miejsca z przeciwnym znakiem
        while polyval(poly,left)*poly(1)>0 
            left=left-10;
        end
    %miejsce zerowe jest na prawo od x0
    else 
        left=x0;
        right=x0+10;
        while polyval(poly,right)*poly(1)<0
            right=right+10;
        end
    end

%stopien parzysty
else
    %zaczynamy poszukiwania na lewo od x0
    left=x0-100; 
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
    convergent = false;
    return
end

middle=(left+right)/2;
%bisekcja
while polyval(poly,middle)>eps
    if (polyval(poly,middle))==0
        bisectionroot=middle;
        return;
    end
    if polyval(poly,middle)*polyval(poly,right)>0
        right=middle;
    else
        left=middle;
    end
    middle=(left+right)/2;
end
bisectionroot=middle;
end