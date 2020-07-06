pkg load signal
N=5;
[B,A]=ellip(N,-20*log10(.99),20,[.3 .4]);