function y= iir(B,A,x)
	nn=length(x);
	w=zeros(1,nn);
	y=zeros(1,nn);
	a = -1 * A(2: end);
	b0 = B(1);
	b = B(2: end);
	N = length(a);
	M = length(b);
	for n=[1:nn]
		Sum1 = Sum2 = 0;
		for p = [N:-1:1]
			if n - p >= 1
				Sum1 = Sum1 + a(p) * w(n - p);
				if p <= M
					Sum2 = Sum2 + b(p) * w(n - p);
				end
			end
			w(n) = Sum1 + x(n);
			y(n) = Sum2 + b0 * w(n);
		end
	end
end
