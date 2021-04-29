function [P,T,Pt2,Tt2,u,M,thrust,mdot0,mdot] = quasi1D()

format longg

syms x1 x2 x3 x4 
% x1 is P; x2 is rho; x3 is T; x4 is u
p = -5.5;
R = 287;
gam =1.4;
kmax = 1000;

T = 1000;
T0 = T;
P = 20000;
P0 = P;
cp =1004.5;
rho = P/R/T
rho0 = rho; 

l = 1;
M = 3;
M0 = M;
u = M*sqrt(gam*R*T);
u0 = u;
cf = 0.01;
Tw = 1000;
eta = 1;
w = 1.5*10^5;
h = 0;
A = .1:(.2/100):.3;
% for convective heat transfer set ht to 1 else set it to 0
ht = 1;

mdot = rho*u*A(1);
for i = 1:length(A)-1
    D = sqrt(A(i)/pi*4);
    c = pi*D;   
    f = @(x1,x2,x3,x4) ([(x2-rho)/x2+(x4-u)/x4+(A(i+1)-A(i))/A(i) (x1-P)/x2+x4*(x4-u)+1/2*cf*rho*u^2*c*(l/length(A))/rho/A(i)-eta*w/length(A) ...
        cp*(x3-T)+x4*(x4-u)-ht*2*cp*cf*(Tw-T*(1+(gam-1)/2*M^2))*l/length(A)/D-(h/length(A))-(w/length(A)) (x3-T)/x3+(x2-rho)/x2-(x1-P)/x1]);
    q = transpose([P,rho,T,u]);
    [q] = IM.newRap(f,q,p,kmax);
    P = q(1)
    rho = q(2)
    T = q(3)
    u = q(4)
    M = u/sqrt(gam*R*T)
    i
end

Tt2 = T*(1+(gam-1)/2*M^2);
Pt2 = P*(1+(gam-1)/2*M^2)^(gam/(gam-1));
thrust = P/R/T*u*A(end)*(u-u0)+P*A(end)-P0*A(1);
P
T
Pt2
Tt2
u
M
thrust
mdot0 = mdot
mdot = rho*u*A(end)
if ht ==1
    Qdot = mdot*(cp*(Tt2-T0*(1+(gam-1)/2*M0^2))-w)
end
end

