function [Pv,Tv,Pt2,Tt2,uv,Mv,thrust,F,mdot0,mdot,V,I,Power,totalPower] = MHD(P0,T0,M,cf,Tw,eta,w,h,ht,A,l,sig0,B,steps,R,gam,height,width)
% Author: Matt P
%{
MHD.m must include IM.m and gauss.m

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
kmax = 1000;
T = T0;
P = P0;
cp = R*gam/(gam-1);
rho = P/R/T;
rho0 = rho; 
M0 = M;
u = M*sqrt(gam*R*T);
u0 = u;
mdot = rho*u*A(1);
totalPower = 0;
Pv = zeros(steps-1,1);
rhov = zeros(steps-1,1);
Tv = zeros(steps-1,1);
uv = zeros(steps-1,1);
Mv = zeros(steps-1,1);
V = zeros(steps-1,1);
I = zeros(steps-1,1);
Power = zeros(steps-1,1);
F = zeros(steps-1,1);
Pv(1,1)=P;
rhov(1,1)=rho;
Tv(1,1)=T;
uv(1,1)=u;
Mv(1,1)=M;
for i = 2:length(A)-1
    G = A(i)*sig0*B^2*u^2*l/length(A)/mdot;
    D = sqrt(A(i)/pi*4);
    c = pi*D;   
    f = @(x1,x2,x3,x4) ([(x2-rho)/x2+(x4-u)/x4+(A(i+1)-A(i))/A(i) (x1-P)/x2+x4*(x4-u)+1/2*cf*rho0*u0^2*c*(l/length(A))/rho/A(i)-G*(1/eta-1)-eta*w/length(A) ...
        cp*(x3-T)+x4*(x4-u)-ht*1/2*cp*cf*(Tw-T*(1+(gam-1)/2*M^2))*c/A(i)*(l/length(A))-G*(1/eta-1)*1/eta-(h/length(A))-(w/length(A)) (x3-T)/x3+(x2-rho)/x2-(x1-P)/x1]);
    q = transpose([P,rho,T,u]);
    [q] = IM.newRap(f,q,p,kmax);
    P = q(1);
    rho = q(2);
    T = q(3);
    u = q(4);
    M = u/sqrt(gam*R*T);
    Pv(i,1)=P;
    rhov(i,1)=rho;
    Tv(i,1)=T;
    uv(i,1)=u;
    Mv(i,1)=M;
    F(i,1) = Pv(i)/R/T*uv(i,1)*A(i)*(uv(i,1)-uv(i-1,1))+Pv(i)*A(i)-Pv(i-1)*A(i-1);
    V(i,1) = B*u/eta*height;
    I(i,1) = sig0*(B*u/eta-B*u)*width*(l/length(A));
    Power(i,1) = V(i,1)*I(i,1);
    totalPower = totalPower + Power(i,1);
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

