w=2*%pi;
im=2;
//t=[0:0.01:1];
t=1;
theta=[0:0.01:2*%pi];
function ret = F(phase)
    dif=2*(phase-1)*(%pi)/3;
    ret=(4/%pi)*im*sin(w*t-dif)*sin(theta-dif);
end    
for t=[1:0.01:10]
    plot(theta,F(1)+F(2)+F(3))
    sleep(100)
    clf()
end