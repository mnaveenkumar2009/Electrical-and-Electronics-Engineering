xa1 = inline('2*cos(10*pi*t)','t');
xa2 = inline('cos(20*pi*t)','t');
xa3 = inline('0.5*cos(60*pi*t)','t');

t = [0:0.001:1];

figure('Name','Task 1')

plot(t,xa1(t),'b',t,xa2(t),'r',t,xa3(t),'k');
xlabel('t');
title('xa1(t),xa2(t) and xa3(t) vs t');
legend('xa1','xa2','xa3');
saveas(gcf,'output/task1.png')

% task i
xa = inline('xa1(t)+xa2(t)+xa3(t)','t');
figure
plot(t,xa(t));
xlabel('t');
ylabel('xa(t)');
title('xa(t) vs t');
saveas(gcf,'output/task1i.png')

%task ii a)
figure
subplot(3,1,1);
Fs= 50;
t1=[0:1/Fs:1];
stem(t1,xa(t1));
title('Fs = 50');
xlabel('t');
ylabel('xa(t)');

%task ii b)
subplot(3,1,2);
% LCM = 60 pi
Fs=60;
t2=[0:1/Fs:1];
stem(t2,xa(t2));
title('Fs = Nyquist rate');
xlabel('t');
ylabel('xa(t)');

%task ii c)
subplot(3,1,3);
t3=[0:1/(5*Fs):1];
stem(t3,xa(t3));
title('Fs = 5 times Nyquist rate');
xlabel('t');
ylabel('xa(t)');

saveas(gcf,'output/task1ii.png')

% task iii a)
figure
subplot(3,1,1);
Fs= 50;
t1=[0:1/50:1];
plot(t1,xa(t1));
title('Fs = 50');
xlabel('t');
ylabel('xa(t)');

%task iii b)
subplot(3,1,2);
% LCM = 60 pi
Fs=60;
t2=[0:1/Fs:1];
plot(t2,xa(t2));
title('Fs = Nyquist rate');
xlabel('t');
ylabel('xa(t)');

%task iii c)
subplot(3,1,3);
t3=[0:1/(5*Fs):1];
plot(t3,xa(t3));
title('Fs = 5 times Nyquist rate');
xlabel('t');
ylabel('xa(t)');

saveas(gcf,'output/task1iii.png')

% task iv
figure
Fs=50;
N=Fs+1;
X=fft(xa(t1));
Xsq=(abs(X).*abs(X))/N;
Fk= [0:N-1]*(Fs/N);
bar(Fk,Xsq);
title('Fs = 50');
xlabel('Fk');
ylabel('Magnitude');

saveas(gcf,'output/task1iva.png')

figure
Fs=60;
N=Fs+1;
X=fft(xa(t2));
Xsq=(abs(X).*abs(X))/N;
Fk= [0:N-1]*(Fs/N);
bar(Fk,Xsq);
title('Fs = Nyquist rate');
xlabel('Fk');
ylabel('Magnitude');

saveas(gcf,'output/task1ivb.png')

figure
Fs=60*5;
N=Fs+1;
X=fft(xa(t3));
Xsq=(abs(X).*abs(X))/N;
Fk= [0:N-1]*(Fs/N);
bar(Fk,Xsq);
title('Fs = 5 times Nyquist rate');
xlabel('Fk');
ylabel('Magnitude');

saveas(gcf,'output/task1ivc.png')