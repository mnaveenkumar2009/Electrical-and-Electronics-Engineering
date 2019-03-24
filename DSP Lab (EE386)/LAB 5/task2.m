warning('off')
pkg load control
pkg load signal
clc;
clear all;
rp=2;
rs=40;
Fs=720;
om_p=20/(Fs);
om_s=40/(Fs);

[n,ws]=cheb1ord(om_p,om_s,rp,rs);

[b,a]= cheby1(n,rp,ws);

sys1 = tf(b, a, 1/Fs )

figure
pzmap(sys1);
xlabel('real');
ylabel('Imaginary');
title('pole zero plot');
saveas(gcf,'output/task2b.png')

figure
[Mag Ph] = bode(sys1,2 * pi * linspace(0,50,100) );
F = linspace(0,50,100);

subplot(2,1,1);
plot(F,Mag);
xlabel('Frequency');
ylabel('Magnitude');
title(['Magnitude vs Frequency']); 

subplot(2,1,2);
plot(F,Ph);
xlabel('Frequency');
ylabel('Phase');
title(['Phase vs Frequency']);
saveas(gcf,'output/task2c.png')