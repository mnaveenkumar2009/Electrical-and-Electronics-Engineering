clear;
a=rand(1,1000);
file = fopen("ran.txt" , "w");
for i = [1:1000]
	fprintf(file,"%f ",a(i));
end

F=[525 590 664 704 790 885 995 1055];
Fs=2500;y=[];
for i=1:length(F)
	t=0.5*(i-1):1/Fs:(0.5*i-1/Fs);
	y=[y sin(F(i)*2*pi*t)];
end
wavwrite(y,Fs,'naveen.wav')
