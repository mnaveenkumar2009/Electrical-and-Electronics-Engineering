M=100;
figure('Name','Task 1')
%i
wi=ones(1,M);
subplot(3,1,1);
plot(wi);
ylabel('Magnitude');
title('Rectangular Window');

%ii
wi=hamming(M);
subplot(3,1,2);
plot(wi);
ylabel('Magnitude');
title('Hamming Window');

%iii
wi=hanning(M);
subplot(3,1,3);
plot(wi);
ylabel('Magnitude');
title('Hanning Window');



saveas(gcf,'output/task1.png')