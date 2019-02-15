warning('off')
% task a)
s=['1','2','3','4','5','6','7','8','9','10'];
for i = [1:5]
	[guitar,Fs]=wavread(["data/Guitar" s(i) ".wav"]);
	f=fft(guitar);
	figure('Name',['Guitar' s(i)],'NumberTitle','off');
	N=length(f);
	decib=20*log((abs(f).*abs(f))/N);
	[maxi,ind]=max(decib);
	disp(["Guitar " s(i)]);
	disp((ind-1)*Fs/N);

	plot([0:N-1]*(Fs/N),decib);
	xlabel('Frequency');
	ylabel('Magnitude in dB');
	title(['Magnitude of Guitar ' s(i) ' vs Frequency (Corresponding Frequency : ' num2text((ind-1)*Fs/N) ')']);
	saveas(gcf,['output/Guitar' s(i) '.png']);
end

clc
clear all
s=['1','2','3','4','5','6','7','8','9','10'];

% task b)
[flute,Fs]=wavread(["data/Flute1.wav"]);
f=fft(flute);
figure('Name','Flute')
N=length(f);
decib=20*log((abs(f).*abs(f))/N);
[maxi,ind]=max(decib);
disp("Flute");
disp((ind-1)*Fs/N);

plot([0:N-1]*(Fs/N),decib);
xlabel('Frequency');
ylabel('Magnitude in dB');
title(['Magnitude of Flute vs Frequency (Corresponding Frequency : ' num2text((ind-1)*Fs/N) ')']);
saveas(gcf,['output/flute.png']);

% Flute is Similar to Guitar 5

[guitar5,Fs5]=wavread(["data/Guitar5.wav"]);
N5=length(guitar5);
f5=fft(guitar5);
decib5=20*log((abs(f5).*abs(f5))/N5);

figure
plot([0:N5-1]*(Fs5/N5),decib5,[0:N-1]*(Fs/N),decib);
xlabel('Frequency');
legend('Guitar 5','Flute');
title(['Magnitude (in dB) vs Frequency']);
saveas(gcf,['output/flute_guitar.png']);