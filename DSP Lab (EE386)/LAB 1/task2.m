n=[-100:1:100];
y=inline('exp(-0.01*n).*sin(0.02*pi*n)','n');

subplot(3,1,1);
stem(n,(y(n)+y(-n))/2);
title("even")
ylabel("y(n)+y(-n))/2")
xlabel("time step")

subplot(3,1,2);
stem(n,(y(n)-y(-n))/2);
title("odd");
ylabel("y(n)-y(-n))/2")
xlabel("time step")

subplot(3,1,3);
stem(n,y(n));
title("original function")
ylabel("y(n)=exp(-0.01*n).*sin(0.02*pi*n)")
xlabel("time step")