warning('off')
% task a)
data=load("data/ECG_Data1.txt");
N=length(data);
Fs=720;
t=[0:1/Fs:((N-1)/Fs)];
plot(t,data);
xlabel('Time');
ylabel('ECG Data');
title(['ECG vs Time']);
saveas(gcf,['output/ECG.png']);

% task b)
f=fft(data);
figure
decib=20*log((abs(f).*abs(f))/N);
plot([0:N-1]*(Fs/N),decib);
xlabel('Frequency (In Hz)');
ylabel('Magnitude in dB');
title(['Frequency Spectrum']);
saveas(gcf,['output/frespec.png']);

% task c)

[maxi,ind]=max(decib(2:N-2));
ind=ind+1; % as we started with 2
[maxi,ind]=max(decib(2:ind-1)); %ignore the 3Hz as it is just too high for a normal human and take second highest
ind=ind+1; % as we started with 2
ind=min(ind,N+1-ind);
disp('Heart Rate in BPM:');
hr=(ind-1)*Fs/N;
hr= hr*60; % in beats per minute
disp(hr);

% task d)

figure
f(1)=0;
%k/N=F/Fs
k= N*20000/Fs;
f(k+1:N+1-k)=0;
signal=ifft(f);
subplot(2,1,1);
plot(t,data);
xlabel('Time');
ylabel('ECG Data');
title(['ECG vs Time']);

subplot(2,1,2);
plot(t,real(signal));
xlabel('Time');
ylabel('ECG Data');
title(['ECG vs Time after removing DC, > 20Hz components']);
saveas(gcf,['output/ECG_2.png']);
