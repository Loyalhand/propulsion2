function x = newRap(f)
syms x

fp(x) = diff(f(x));

x=.1;
nmax=25;
eps=1;
n=0;

while eps>=1e-5&&n<=nmax
    y=x-double(f(x))/double(fp(x));
    eps=abs(y-x);
    x=y;
    n=n+1;
end