pkg load signal
N=5;
[B,A]=ellip(N,-20*log10(.99),20,[.3 .4]);

tic()
stpresp=iir(B,A,linspace(1,1,600));
toc()
plot(stpresp);

xlabel('Time');
ylabel('Magnitude');
title('Step Response using direct IIR');
saveas(gcf,'output/task3a.png');

a = -1 * A(1: end);

b = B(1: end);
sys=tf(b,a,-1)
tic()
[y,t]=step(sys);
toc()
figure()
plot(t,y);
xlabel('time');
ylabel('Magnitude');
title('Step Response using step function');
saveas(gcf,'output/task3b.png');