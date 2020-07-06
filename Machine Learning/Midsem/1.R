# a

M = runif(1000)*100; # 0 to 100
print(summary(M))

#b
X1 = sample(M, 200); # sampling 200 data
X1N = scale(X1);
print(summary(X1))
print(summary(X1N))
X2 = sample(M, 200); # sampling 200 data
X2N = scale(X2);
X3 = sample(M, 200); # sampling 200 data
X3N = scale(X3);
X4 = sample(M, 200); # sampling 200 data
X4N = scale(X4);
X5 = sample(M, 200); # sampling 200 data
X5N = scale(X5);
X6 = sample(M, 200); # sampling 200 data
X6N = scale(X6);
X7 = sample(M, 200); # sampling 200 data
X7N = scale(X7);
X8 = sample(M, 200); # sampling 200 data
X8N = scale(X8);
X9 = sample(M, 200); # sampling 200 data
X9N = scale(X9);
X10 = sample(M, 200); # sampling 200 data
X10N = scale(X10);
X11 = sample(M, 200); # sampling 200 data
X11N = scale(X11);
X12 = sample(M, 200); # sampling 200 data
X12N = scale(X12);
X13 = sample(M, 200); # sampling 200 data
X13N = scale(X13);
X14 = sample(M, 200); # sampling 200 data
X14N = scale(X14);
X15 = sample(M, 200); # sampling 200 data
X15N = scale(X15);


#c

hist(X2N);