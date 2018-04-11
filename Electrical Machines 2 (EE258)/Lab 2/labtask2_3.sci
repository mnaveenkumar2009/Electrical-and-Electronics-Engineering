w=2*%pi*f;
thetaI=atan(imag(I)/real(I));
thetaVt=atan(imag(Vt)/real(Vt));
thetaE=atan(imag(E)/real(E));
modVt=(real(Vt)*real(Vt))+(imag(Vt)*imag(Vt));
modVt=sqrt(modVt);
modI=(real(I)*real(I))+(imag(I)*imag(I));
modI=sqrt(modI);
modE=(real(E)*real(E))+(imag(E)*imag(E));
modE=sqrt(modE);
t=[0:0.0001:%1/50];
subplot(3,1,1);
plot(t,sqrt(2).*(modI*sin(w.*t+thetaI)));
subplot(3,1,2);
plot(t,sqrt(2).*(modVt*sin(w.*t+thetaVt)));
subplot(3,1,3);
plot(t,sqrt(2).*(modE*sin(w.*t+thetaE)));

