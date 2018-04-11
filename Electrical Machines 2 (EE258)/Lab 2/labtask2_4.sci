rmsI=RMS(t,sqrt(2).*(modI*sin(w.*t+thetaI)));
rmsVt=RMS(t,sqrt(2).*(modVt*sin(w.*t+thetaVt)));
rmsE=RMS(t,sqrt(2).*(modE*sin(w.*t+thetaE)));
disp("RMS value of E is",rmsVt,"RMS value of Vt is",rmsI,"RMS value of I is");
