function X1 = fp(X,B)
	Xm = max(abs(X));
	X /=Xm;
	B -=1;
	x1 = round(X/2^-B)*2^-B;
	X1 = x1*Xm;
end
