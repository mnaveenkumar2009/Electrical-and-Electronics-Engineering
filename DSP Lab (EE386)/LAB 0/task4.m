r=input('please enter radius of the circle');
x=[-r:0.01:r];
y=sqrt(r*r-x.*x);
plot(x,y,'k',x,-y,'k');
