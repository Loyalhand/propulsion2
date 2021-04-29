% matthew Pahayo
% main.m
clc
clear all
close all
 
format longg
syms x M2 Me

cf = .05;
L = 1;
D = .01;
M1 = .03; 
Tt1 = 200; 
Pt1 = 200000;
mdot = .5;
Ts = 3200;
gam = 1.4;
R = 4125; 
cp = gam*R/(gam-1);
Ae = 1.573;

delTm = (Ts-Tt1)/(2*cf*L/pi/D)/(1+sqrt((1+((pi*D)/(2*cf*L))^2)))
Tt2 = Tt1+4*cf*L/pi/.01*delTm
Tt = symfun(2*cf/D*delTm*L/pi*(1-cos(pi*x/L))+Tt1,x)
Tw = Tt + delTm*sin(pi*x/L)
xbyL = 1 + 1/pi*atan(-pi*D/2/cf/L)
Qdot = int(2*cf*cp*(Tw-Tt)/D,0,1)*mdot

f = symfun(-sqrt(Tt2/Tt1)+(M2/M1)*((1+gam*M1^2*(1-cf*L/D))/(1+gam*M2^2*(1+cf*L/D)))*...
    ((1+(gam-1)/2*M2^2)/(1+(gam-1)/2*M1^2))^(1/2),M2)
M2 = rootFind.newRap(f,0)

Pr = ((1+gam*M1^2*(1-cf*L/D))/(1+gam*M2^2*(1+cf*L/D)))
Pte = Pr*((1+(gam-1)/2*M2^2)/(1+(gam-1)/2*M1^2))^(gam/(gam-1))*Pt1
g = symfun(Pte*Ae/sqrt(Tt2)*sqrt(gam/R)*Me*(1+(gam-1)/2*Me^2)^(-(gam+1)/2/(gam-1))-mdot,Me)
Me = rootFind.newRap(g,3)
Te = Tt2/(1+(gam-1)/2*Me^2)
Pe = Pte/((1+(gam-1)/2*Me^2))^(gam/(gam-1))
ue = Me*sqrt(gam*R*Te)
thrust = mdot*ue + Pe*Ae
ISP = thrust/mdot/9.8

for i = 1:100
    Twall(i) = double(Tw(i/100));
    Ttotal(i) = double(Tt(i/100));
    Tes(i) = Ts;
end
i = 1:100;
hold on
plot(i,Twall)
plot(i,Ttotal)
plot(i,Tes,'--')
legend('Tw','Tt','Max wall temperature','Location','southeast')
ylabel('Temperature [K]')
xlabel('length across channel [cm]')
title('Temperature across channels')
grid on
hold off