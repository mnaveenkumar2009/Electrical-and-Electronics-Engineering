x=0
flag=1;
while(flag==1)
{
  f=x^6-2;
  if(abs(f)<=0.02)
    flag=0
  x=x+0.01;
 }####distributions
pnorm(42,42,10)#cdf
dnorm(v,0,1)#pdf
qnorm(v)#inverse of cdf
rnorm(10,mean=0,sd=1)#generates a vector
#
dbinom(4, size=12, prob=0.2)
pbinom(4,size=12,prob=0.2)
rbinom(10,12,0.5)#rbinom (# observations, # trails/observation, probability of success 
qbinom(0.25,10,0.5)
#
dgeom(1,0.5)
pgeom(1,0.5)
rgeom(6,0.5)
qgeom(0.75,0.5)
#
dexp(10,1)
pexp(10,1)
rexp(10,1)
qexp(0.9,1)
#
dunif(x, min = 0, max = 1, log = FALSE)
punif(x, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
qunif(p, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
runif(n, min = 0, max = 1)
#
f.X <- function(x) dnorm(x,1,0.5)        # normal (mu=1.5, sigma=0.5)
f.Y <- function(y) dnorm(y,1.5, 0.75)   # log-normal (mu=1.5, sigma=0.75)
# convolution integral
#f.Z <- function(z) integrate(function(x,z) f.Y(z-x)*f.X(x),-Inf,Inf,z)$value
#f.Z <- Vectorize(f.Z)                    # need to vectorize the resulting fn.
#z=seq(-10,10,0.001)
#plot(z,f.Z(z), type='l')
#sum((z<=0.5)*f.Z(z))
