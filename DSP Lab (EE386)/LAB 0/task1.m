t=[0:0.01:1];
subplot(2,1,1);
plot(t,sin(20*pi*t),'k');
hold on
plot(t,cos(5*pi*t),'r');
legend("sin(20*pi*t)","cos(5*pi*t)");
hold off
xlabel("time");
ylabel("sin and cos")

subplot(2,1,2);
plot(t,exp(-2*t),'k',t,sin(20*pi*t).*exp(-0.5*t),'r');
legend("exp(-2*t)","sin(20*pi*t).*exp(-0.5*t)");
xlabel("time");
ylabel("exp and exp with sin");

figure
subplot(2,2,1);
stem(t,sin(20*pi*t));
subplot(2,2,2);
stem(t,cos(5*pi*t));
subplot(2,2,4);
stem(t,sin(20*pi*t).*exp(-0.5*t));
subplot(2,2,3);
stem(t,exp(-2*t));

