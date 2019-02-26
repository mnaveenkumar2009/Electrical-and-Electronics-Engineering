t=0:0.01:10;
xa=0.1*sin(30*pi*t)+ cos(36*pi*t)+0.5*sin(14*pi*t);
Fs=100;

% task a)
xa2=xa(1:210).*(hamming(210))';
figure('Name','2 a)');
plot([0:length(xa2)-1]/100,xa2);

xlabel('time');
ylabel('x_w');
title(['xa(1:210) with hamming window']);
saveas(gcf,'output/task2a.png')

f=fft(xa2);
figure('Name','2 b)')
N=length(f);
decib= abs(f)/N;
plot([0:N-1]*(Fs/N),decib);

xlabel('Frequency');
ylabel('Magnitude');
title(['xa(1:210) with hamming window']);
saveas(gcf,'output/task2b.png')