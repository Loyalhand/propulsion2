clc
clear all
close all
 
steps = 100
cf = 0
Tw = 0
eta = .7;
w = 0;
h = 0;
A = ones(1,steps)*.2*.2;
% for convective heat transfer set ht to 1 else set it to 0
ht = 0;
l = 5;
sig0 = 100;
B=1;
R = 4125;
gam =1.4;
height = .2
width = .2

[P,T,Pt2,Tt2,u,M,thrust,F,mdot0,mdot,V,I,Power,totalPower] = MHD(100000,300,1.14,cf,Tw,eta,w,h,ht,A,l,sig0,B,steps,R,gam,height,width);