function [P,T,Pt2,Tt2,u,M,thrust,mdot0,mdot] = quasi1D(P0,T0,M,cf,Tw,eta,w,h,ht,A,l)
% Author: Matt P
%{
quasi1D must include IM.m and gauss.m

P0 is the static pressure at the inlet
T0 is the static temperature at the inlet
M is the Mach # at the inlet
cf is the coefficient of skin friction
Tw is the wall temperature
eta is the thermodynamic efficiency
w is the work interaction per mass
h is the heat interaction per mass
ht is for convective heat transfer - 1 if present, 0 if not
A is the area along the length of the channel/nozzle and is a ROW VECTOR
l is the length of the device
%}

format longg

syms x1 x2 x3 x4 
% x1 is P; x2 is rho; x3 is T; x4 is u
p = -7.0;
R = 287;
gam =1.4;
kmax = 1000;
T = T0;
P = P0;
cp =1004.5;
rho = P/R/T
rho0 = rho; 
M0 = M;
u = M*sqrt(gam*R*T);
u0 = u;
mdot = rho*u*A(1);
for i = 1:length(A)-1
    D = sqrt(A(i)/pi*4);
    c = pi*D;   
    f = @(x1,x2,x3,x4) ([(x2-rho)/x2+(x4-u)/x4+(A(i+1)-A(i))/A(i) (x1-P)/x2+x4*(x4-u)+1/2*cf*rho*u^2*c*(l/length(A))/rho/A(i)-eta*w/length(A) ...
        cp*(x3-T)+x4*(x4-u)-ht*1/2*cp*cf*(Tw-T*(1+(gam-1)/2*M^2))*c/A(i)*(l/length(A))-(h/length(A))-(w/length(A)) (x3-T)/x3+(x2-rho)/x2-(x1-P)/x1]);
    q = transpose([P,rho,T,u]);
    [q] = IM.newRap(f,q,p,kmax);
    P = q(1);
    rho = q(2);
    T = q(3);
    u = q(4);
    M = u/sqrt(gam*R*T);
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

