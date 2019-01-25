n=[-5:1:5];

figure('Name','Task 1','NumberTitle','off');

%task a
subplot(2,3,1);
y=int8(mystepfun(n));
stem(n,y);
xlabel('time step (n)');
ylabel('u(n)');
title('u(n) vs n')

%task b
subplot(2,3,2);
y=mystepfun(n-2);
stem(n,y);
xlabel("time step (n)");
ylabel("u(n-2)");
title('u(n-2) vs n')

%task c
subplot(2,3,3);
y=mystepfun(n+3);
stem(n,y);
xlabel("time step (n)");
ylabel("u(n+3)");
title('u(n+3) vs n')

%task d
subplot(2,3,4);
y=mystepfun(-n-2);
stem(n,y);
xlabel("time step (n)");
ylabel("u(-n-2)");
title('u(-n-2) vs n')

%task e
subplot(2,3,5);
y=mystepfun(-n+3);
stem(n,y);
xlabel("time step (n)");
ylabel("u(-n+3)");
title('u(-n+3) vs n')

saveas(gcf,'output/plot1.png')