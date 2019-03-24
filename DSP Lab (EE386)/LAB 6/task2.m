figure('Name',['Rectangle'])
for M = [25,50,100]
	subplot(3,1,log2(M/25)+1);
	%i
	wi=ones(1,M);
	f=fft(wi,1000);
	N=length(f);
	magn= abs(f)/M;
	magn=20*log(magn);
	plot([0:N-1]*(1/N),magn);
	xlabel('Frequency');
	ylabel('Magnitude (in dB)');
	title(['Rectangle Window ' num2text(M) ' Samples']);
end
saveas(gcf,'output/task2a.png')

figure('Name',['Hamming'])

for M = [25,50,100]
	subplot(3,1,log2(M/25)+1);
	%ii
	wi=hamming(M);
	f=fft(wi,1000);
	N=length(f);
	magn= abs(f)/M;
	magn=20*log(magn);
	plot([0:N-1]*(1/N),magn);
	xlabel('Frequency');
	ylabel('Magnitude (in dB)');
	title(['Hamming Window ' num2text(M) ' Samples']);
end
saveas(gcf,'output/task2b.png')

figure('Name',['Hanning'])

for M = [25,50,100]
	subplot(3,1,log2(M/25)+1);
	%iii
	wi=hanning(M);
	f=fft(wi,1000);
	N=length(f);
	magn= abs(f)/M;
	magn=20*log(magn);
	plot([0:N-1]*(1/N),magn);
	xlabel('Frequency');
	ylabel('Magnitude (in dB)');
	title(['Hanning Window ' num2text(M) ' Samples']);
end
saveas(gcf,'output/task2c.png')