function x0 = Bairstow(coef, x0)
%Bairwsow - Description
%
% Syntax: function = Bairstow(coef, x0)
%
% Long description
    x0 = x0(:);
    coef = coef(:);
    for i=1:100
        p=[1; -x0(:)];
        [p1, AB] = deconv(coef, p);
        AB=AB(end-1:end);
        AB=AB(:)
        [~,AB1]=deconv(p1, p);
        AB1=AB1(end-1:end);
        AB1=AB1(:);
        %J=[Ar, Aq; Br, Bq];
        A1=AB1(1);
        B1=AB1(2);
        Aq=A1;
        Bq=B1;
        Ar=x0(1)*A1+B1;
        Br=x0(2)*A1;
        x0=x0-inv([Ar, Aq; Br, Bq])*AB;
    end
end