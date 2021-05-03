clc
clear all
close all
 
cf = 0.01;
Tw = 1000;
eta = 1;
w = 1.5*10^5;
h = 0;
A = .1:(.2/100):.3;
% for convective heat transfer set ht to 1 else set it to 0
ht = 1;
l = 1;

[P,T,Pt2,Tt2,u,M,thrust,mdot0,mdot] = quasi1D(20000,1000,3,cf,Tw,eta,w,h,ht,A,l);