[track,Fs]=wavread("data/Track001.wav");
wavwrite(track,Fs,'output/Track001_orig.wav');

Conv1=load('data/ConvFile1.txt');
Conv2=load('data/ConvFile2.txt');

track1=conv(Conv1,track);
wavwrite(track1,Fs,'output/Track001_conv1.wav')

track2=conv(Conv2,track);
wavwrite(track2,Fs,'output/Track001_conv2.wav')

figure('Name','Filters','NumberTitle','off')

subplot(2,1,1);
x=fft(Conv2);
x=abs(x);
plot(x.*x);
title('Low pass filter ConvFile2.txt');
ylabel('Magnitude')
xlabel('Frequency')

subplot(2,1,2);
x=fft(Conv1);
x=abs(x);
plot(x.*x);
title('High pass filter ConvFile1.txt');
ylabel('Magnitude')
xlabel('Frequency')

saveas(gcf,'output/plot4_filters.png')