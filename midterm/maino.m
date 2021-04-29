clc
clear all
close all
 
format longg


syms w x y z 
% w is P; x is rho; y is T; z is u
p = -5;
M = .7;
R = 287;
gam =1.4;
kmax = 1000;
rho = 1.225;
T = 288;
A = .1:.01:.532;
P = 101325;
u = M*sqrt(gam*R*T);
cp =1004.5;
mdot = rho*u*A(1);
i = 1
f = @(w,x,y,z) [(x-rho)/x+(z-u)/z+(A(i+1)-A(i))/A(i+1);(w-P)/x+z*(z-u);cp*(y-T)/y+z*(z-u);(y-T)/y+(x-rho)/x-(w-P)/w]
q = transpose([P,rho,T,u])
A = jacobian((x-rho)/x+(z-u)/z+(A(i+1)-A(i))/A(i+1); (w-P)/x+z*(z-u); cp*(y-T)/y+z*(z-u); (y-T)/y+(x-rho)/x-(w-P)/w)
##for i = 1:length(A)-1
##    f = @(w,x,y,z) [(x-rho)/x+(z-u)/z+(A(i+1)-A(i))/A(i+1);(w-P)/x+z*(z-u);...
##        cp*(y-T)/y+z*(z-u);(y-T)/y+(x-rho)/x-(w-P)/w];
##    ;
##    q = IMo.newRap(f,q,p,kmax);
##    P = q(1)
##    rho = q(2)
##    T = q(3)
##    u = q(4)
##    i
##end