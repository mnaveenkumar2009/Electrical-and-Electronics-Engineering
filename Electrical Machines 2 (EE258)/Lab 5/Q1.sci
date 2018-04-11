vm=1;
w=20;
t=[0:0.01:1];
function ret = h(phase)
    dif=2*(phase-1)*(%pi)/3;
    ret=vm*sin(w*t-dif)+vm*sin(3*(w*t-dif))/3;
end    
plot(t,h(2)-h(3))