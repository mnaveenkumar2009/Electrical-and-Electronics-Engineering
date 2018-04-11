function ret = RMS(x,y)
ret = 0;	
	for i = 1:1:size(y)(2)//row matrix
		ret=ret+y(i).*y(i);
	end
disp(ret)
ret=ret/size(y)(2);
ret=sqrt(ret);
end
