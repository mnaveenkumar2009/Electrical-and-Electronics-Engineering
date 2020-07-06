clc;
clear;
pkg load signal
pkg load control
warning('off')

% from task 2)
N = 5;
[B,A] = ellip(N,-20*log10(.99),20,[.3 .4]);


for BitLength = [20 16 12]

    x = tf(B,A,-1);
    T = 0:600;
    
    y_old = step(x,T)';

    x1 = ones(1,601);
    y_new = iir(fp(B,BitLength),fp(A,BitLength),x1);
    [SOS,G] = tf2sos(B,A);
    
    Y = ones(1,601);
    for i = 1:5
        Y = iir(fp(SOS(i,1:3),BitLength),fp(SOS(i,4:6),BitLength),Y);
    end
    Y = G*Y;

    tyerror1 = mean(abs(y_old-y_new))
    tyerror2 = mean(abs(y_old-Y))
    plot(T,Y,'k',T,y_old,'r',T,y_new,'g')
    title(['Various Responses for a bit length of' n2t(BitLength)]);
    xlabel('samples');
    ylabel('value of step response of the filter');
    legend('using the cascade form ','using  the inbuilt step function','using the direct form II');
    saveas(gcf,['output/task3' n2t(BitLength) '.png'])
end