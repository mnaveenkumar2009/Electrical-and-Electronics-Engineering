F=[525 590 664 704 790 885 995 1055];
s=['1','2','3','4','5','6','7','8','9','10'];
for ii=[1000:500:2500]
	Fs=ii;y=[];
	for i=1:length(F)
		t=0.5*(i-1):1/Fs:(0.5*i-1/Fs);
		y=[y sin(F(i)*2*pi*t)];
	end
	disp((ii-500)/500)
	wavwrite(y,Fs,['naveen' s((ii-500)/500) '.wav']);
end

