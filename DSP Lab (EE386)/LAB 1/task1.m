n=[-5:1:5];


%task a
subplot(3,2,1);
y=int8(mystepfun(n));
stem(n,y);
xlabel('time step');
ylabel('u(n)');

%task b
subplot(3,2,2);
y=mystepfun(n-2);
stem(n,y);
xlabel("time step");
ylabel("u(n-2)");

%task c
subplot(3,2,3);
y=mystepfun(n+3);
stem(n,y);
xlabel("time step");
ylabel("u(n+3)");

%task d
subplot(3,2,4);
y=mystepfun(-n-2);
stem(n,y);
xlabel("time step");
ylabel("u(-n-2)");

%task e
subplot(3,2,5);
y=mystepfun(-n+3);
stem(n,y);
xlabel("time step");
ylabel("u(-n+3)");