clc
clear all
close all

height = .05
width = .05 
steps = 10000
cf = 0.002
eta = .9;
Tw = 220
w = 0;
h = 0;
A = ones(1,steps)*height*width;
% for convective heat transfer set ht to 1 else set it to 0
ht = 1;
l = 1;
sig0 = 200;
B = .8;
R = 4125;
gam =1.4;


M = 1.2
Pi = 100000
Ti = 320

[P,T,Pt2,Tt2,rho,u,M,thrust,F,mdot0,mdot,V,Ic,Powerc,forcec] = MHD(Pi,Ti,M,cf,Tw,eta,w,h,ht,A,l,sig0,B,steps,R,gam,height,width);
