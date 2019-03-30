pkg load signal
N = 5;
[B,A] = ellip(N, -20*log10(0.99),20, [0.3 0.4]);

BAs = reshape(tf2sos(B, A), 5, 3, 2); % left half is B and right half is A .. N *6 matrix is obtained
t = [0:1000];

# Step response using Direct Form II
tic()
y = iir(B, A, ones(1,1001));
toc()


tic()
trans = tf(B,A,-1);
y2 = step(trans,t);
toc()

tic()
y3 = iir(BAs(1, :, 1), BAs(1, :, 2), ones(1,1001));
for i = 2:5
	y3 = iir(BAs(i,:,1), BAs(i,:,2), y3);
end
toc()


figure();
plot(t,y);
xlabel('t');
ylabel('y');
title("Step Response: Direct Form II");
saveas(gcf,'output/task4to6a.png');

figure()
plot(t,y2);
xlabel('t');
ylabel('y');
title("Step Response: Using step()");
saveas(gcf,'output/task4to6b.png');

figure()
plot(t,y3);
xlabel('t');
ylabel('y');
title("Step Response: Using a cascade of equation");
saveas(gcf,'output/task4to6c.png');

