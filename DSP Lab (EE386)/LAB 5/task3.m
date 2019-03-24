close all
clc
clear all
warning('off')
pkg load control
pkg load signal

Fs=720;
Wp=20/720;
Ws=40/720;
dp=2;
ds=40;

[n,Wc]=buttord(Wp,Ws,dp,ds);
[b,a]=butter(n,Wc);
sys1=tf(b,a,1/Fs);

[n2,Wc2]=cheb1ord(Wp,Ws,dp,ds);
[b2,a2]=cheby1(n2,dp,Wc2);
sys2=tf(b2,a2,1/Fs);

[y1b,t1b]=impulse(sys1,1,1/Fs);
[y1c,t1c]=impulse(sys2,1,1/Fs);

figure()
plot(t1b,y1b,"r;Butterworth;",t1c,y1c,"b;Chebyshev;");
xlabel('time')
title('Impulse Response');
saveas(gcf,'output/task3a.png')

[y2b,t2b]=step(sys1,1,1/Fs);
[y2c,t2c]=step(sys2,1,1/Fs);

figure()
plot(t2b,y2b,"g;Butterworth;",t2c,y2c,"m;Chebyshev;");
xlabel('time')
title('Step Response');
saveas(gcf,'output/task3b.png')