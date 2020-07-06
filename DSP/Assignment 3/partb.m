Fs=1000;
rp=2;
rs=40;
Wp=20*pi;
Ws=40*pi;
wp=Wp/(pi*Fs);
ws=Ws/(pi*Fs);
[n,wc]=buttord(wp,ws,rp,rs);
%finding order of filter
[b,a]=butter(n,wc);
%finding filter coefficients
sys1=tf(b,a,1/Fs);
%finding the transfer function of filter
[p,z]=pzmap(sys1);
%finding the poles and zeros of filter
figure();
pzmap(sys1)
title('Pole Zero Map- Butterworth Filter')
figure()
freqz(b,a)
title('Bode Plot of ButterWorth Filter')


Fs=1000;
rp=2;
rs=40;
Wp=20*pi;
Ws=40*pi;
wp=Wp/(pi*Fs);
ws=Ws/(pi*Fs);
[n,wc]=cheb1ord(wp,ws,rp,rs);
[b,a]=cheby1(n,rp,wc);
sys1=tf(b,a,1/Fs);
[p,z]=pzmap(sys1);
figure();
pzmap(sys1)
title('Pole Zero Map- Cheby I Filter')
figure()
freqz(b,a)
title('Bode Plot of Cheby I Filter')
%kaiser window based FIR FIlter
Fp=20;
Fsb=40;
Dp=2;
Dp1=0.794;
Ds=40;
Ds1=0.01;
Fs=1000;
[n,wn,beta,fil]=kaiserord([Fp Fsb],[1 0],[Dp1,Ds1],Fs);
w=kaiser(n,beta);
b=fir1(n-1,wn,'low',w);
figure()
freqz(b)
title('Frequency response of Kasier Window Based FIR Filter')
sys=tf(b,[1 zeros(1,n-1)],-1);
figure()
pzmap(sys)
title('Pole Zero Map- FIR Filter with Kaiser Window')