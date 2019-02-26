data=load("data/Exp4Data.txt");
Fs=114;

% task a)
figure
f=fft(data(1:100));
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);
xlabel('Frequency');
ylabel('Magnitude');
title(['100 samps of Exp4Data']);
saveas(gcf,'output/task3ai.png')

figure
f=fft(data(1:1000));
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);
xlabel('Frequency');
ylabel('Magnitude');
title(['1000 samps of Exp4Data']);
saveas(gcf,'output/task3aii.png')

% F = 25 Hz

%task b)

xa2=data(1:100).*(hamming(100));

f=fft(xa2);
figure('Name','2 b)')
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);
xlabel('Frequency');
ylabel('Magnitude');
title(['100 samps with hamming window']);
saveas(gcf,'output/task3bi.png')

xa2=data(1:1000).*(hamming(1000));

f=fft(xa2);
figure('Name','2 b)')
N=length(f);
magn= abs(f)/N;
plot([0:N-1]*(Fs/N),magn);
xlabel('Frequency');
ylabel('Magnitude');
title(['1000 samps with hamming window']);
saveas(gcf,'output/task3bii.png')