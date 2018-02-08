%% Program-rozpoznawanie instrument�w muzycznych
%wczytaj plik
[Y,Fs] = audioread('organy.wav');
% 
%normalizacja
y_norm=Y/max(Y);

%wykres przed usunieciem ciszy
% plot(y_norm);
% title('Wykres po normalizacji przed usuwaniem ciszy');
% xlabel('numer pr�bki');
% ylabel('amplituda');
% 
% %parametry ramek
nwind = 1440;%(z proporcji)
nframes = 270;% y_norm/nwind

% %podzia� sygna�u na ramki 
ramki=reshape(y_norm(1:nwind*nframes), nwind, nframes);
% %
% %obliczenie energii kolejnych probek w ramkach
energiaRamki = (1/nwind)*sum(ramki.^2);
%kryterium usuniecia ciszy
y_oczyszczone = ramki(:,energiaRamki>0.001);

y_oczyszczone = y_oczyszczone(:);
% 
% %wykres po usunieciu ciszy
% figure(1)
% plot(y_oczyszczone);
% title('Wykres po normalizacji usuni�ciu ciszy');
% xlabel('numer pr�bki');
% ylabel('amplituda');
%zapis nagrania bez fragmentow ciszy
audiowrite('organybez_ciszy.wav',y_oczyszczone,48000);
% %Wczytanie plik�w muzycznych z usuni�tami chwilami ciszy
% %Spr�bkowanie sygna��w z t� sama cz�stotliwo�ci� 
% %"Wyci�cie" danej pr�bki-1 sekunda
% %Analiza danej pr�bki 
% figure
intrument=audioread('organybez_ciszy.wav'); %wczytanie �cie�ki d�wi�kowej bez ciszy
length(intrument); %d�ugo�� sie�ki d�wi�kowej 
length(intrument)/44100;%44100-sound(CD) quality
instrument_seg=intrument(1:44100); %2 sekundy
% plot(instrument_seg);
% title('Wykres po normalizacji usuni�ciu ciszy oraz pr�bkowaniu')
% xlabel('numer pr�bki');
% ylabel('amplituda');
% sound(instrument_seg,44100);
% audiowrite('organybez_ciszy_krotki.wav',instrument_seg,44100);
% %Wyznaczenie spektogramu
% figure
window_width = 600; %szeroko�� okna hanninga 
frequency_s=44100; %cz�stotliwo�� pr�bkowania 
freq_range=1:44100; %zakres pr�bkowania 
% spectrogram(intrument(1:44100));
% figure
% hist(intrument(1:44100))
% title('Histogram');
% xlabel('numer pr�bki');
% ylabel('amplituda');
% 
% [Y,Fs] = audioread('puzon.wav');
% instrumentshort=audioread('puzonbez_ciszy_krotki.wav'); %PUZON

% [Y,Fs] = audioread('Skrzypce.wav');
% instrumentshort=audioread('skrzypcebez_ciszy_krotki.wav'); %SKRZYPCE

% [Y,Fs] = audioread('Piccolo.wav');
% instrumentshort=audioread('piccolobez_ciszy_krotki.wav'); %FLET PICCOLO

% [Y,Fs] = audioread('harfa.wav');
% instrumentshort=audioread('harfabez_ciszy_krotki.wav'); %HARFA
% 
[Y,Fs] = audioread('organy.wav');
instrumentshort=audioread('organybez_ciszy_krotki.wav'); %ORGANY KO�CIELNE
% [Y,Fs] = audioread('Skrzypce.wav');
% player = audioplayer(Y,Fs)
% play(player);
maksimum_insrument=findpeaks(instrumentshort);
findpeaks(instrumentshort);
close all
[maxValue maxx] = max(instrumentshort)%Wyznaczenie jednego maksimum znormalizowanej funkcji 
% % Zaznaczenie maksima na wykresie 

plot(instrument_seg);
hold on
scatter(maxx,maxValue,'*');
title('Wykres po normalizacji, usuni�ciu ciszy oraz pr�bkowaniu, z zaznaczonym punktem maksimum');
xlabel('numer pr�bki');
ylabel('amplituda');
% PUZON 
% maxValue = 0.6334
% maxx = 27664
% 
% SKRZYPCE
% maxValue =0.5809
% maxx =39901
% 
% PICCOLO
% maxValue =0.5155
% maxx=20106
% 
% HARFA
% maxValue =0.4793
% maxx =23302
% 
% ORGANY
% maxValue =0.4764
% maxx =20156

% if(maxx==27664)
%     disp('ROZPOZNANO PUZON')
% end
% if(maxx==39901)
%     disp('ROZPOZNANO SKRZYPCE')
% end
% if(maxx==20106)
%     disp('ROZPOZNANO FLET PICCOLO')
% end
% if(maxx==23302)
%     disp('ROZPOZNANO HARF�')
% end
% if(maxx==20156)
%     disp('ROZPOZNANO ORGANY KO�CIELNE')
% end
