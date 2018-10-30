%wykres bledow bezwzglednych miedzy wartosciami policzonymi w wykres1
error=abs(f-vals);
plot(x,error);
grid on;
title('Bledy bezwzgledne przy 10 wezlach');
xlabel('x');
ylabel('Roznica');