pkg load signal
wc=pi/4;
M=21;
wi=ones(1,M);
wi2=hamming(M);

filt=fir1(20,wc,wi);
filt2=fir1(20,wc,wi2);

sys1=tf(filt,1,1);
sys2=tf(filt2,1,1);

figure
stem(filt);
xlabel('n');
ylabel('Magnitude');
title(['Impulse Response']);
saveas(gcf,'output/task3a.png')

figure
stem(filt2);
xlabel('n');
ylabel('Magnitude');
title(['Impulse Response']);
saveas(gcf,'output/task3b.png')


figure
freqz(filt);
saveas(gcf,'output/task3c.png')
figure
freqz(filt2);
saveas(gcf,'output/task3d.png')
