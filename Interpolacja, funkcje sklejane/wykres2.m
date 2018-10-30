%wykres bledow bezwzglednych miedzy wartosciami policzonymi w wykres1
error=abs(f-vals);
plot(x,error);
grid on;
title('Bledy bezwzgledne');
xlabel('x');
ylabel('Roznica');