warning('off')
t=0:0.01:10;
xa=0.1*sin(30*pi*t)+cos(36*pi*t)+0.5*sin(14*pi*t);

% task a)

Fs=100;

f=fft(xa(1:100));
figure('Name','1 a)')
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);

xlabel('Frequency (Hz)');
ylabel('Magnitude');
title(['xa(1:100) in frequency domain']);
saveas(gcf,['output/task1a.png']);

% task b)

f=fft(xa(1:210));
figure('Name','1 b)')
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);

xlabel('Frequency (Hz)');
ylabel('Magnitude');
title(['xa(1:210) in frequency domain']);
saveas(gcf,['output/task1b.png']);
