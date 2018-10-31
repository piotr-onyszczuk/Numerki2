%wykres bledow bezwzglednych i wzglednych miedzy wartosciami policzonymi w wykres1

%bledy bezwzgledne
subplot(2,2,2);
error=abs(f-vals);
plot(x,error);
grid on;
title('Bledy bezwzgledne');
xlabel('x');
ylabel('Roznica');

%bledy wzgledne
subplot(2,2,3);
plot(x,100*error./f);
grid on;
title('Bledy wzgledne');
xlabel('x');
ylabel('%');