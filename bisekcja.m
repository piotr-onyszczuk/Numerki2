function [convergent, tmpzerowe] = bisekcja(poly)
A=linspace(-1e4,1e4);
negative=0;
positive=0;
convergent=true;
for i=1:length(A)
    if(polyval(poly,A(i))==0)
        convergent=true;
        tmpzerowe=A(i);
        return;
    end
    if(polyval(poly,A(i))<0)
        negative=A(i);
    else
        positive=A(i);
    end
end
if polyval(poly,positive)<0 || polyval(poly,negative)>0
    convergent=false;
    return;
end

%bisekcja
for i=1:1000
    middle=(negative+positive)/2;
    if (polyval(poly,middle))==0
        tmpzerowe=middle;
        return;
    end
    if (polyval(poly,middle))>0
        positive=middle;
    else
        negative=middle;
    end
end
tmpzerowe=(negative+positive)/2;
end