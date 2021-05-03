clc
clear all
close all
 
steps = 200
cf = 0
Tw = 0
eta = .9;
w = 0;
h = 0;
A = ones(1,steps)*.05*.05;
% for convective heat transfer set ht to 1 else set it to 0
ht = 0;
l = 1;
sig0 = 200;
B = .8;
R = 4125;
gam =1.4;
height = .05
width = .05

M = 1.2
Pi = 100000
Ti = 320

[P,T,Pt2,Tt2,u,M,thrust,F,mdot0,mdot,V,I,Power,totalPower] = MHD(Pi,Ti,M,cf,Tw,eta,w,h,ht,A,l,sig0,B,steps,R,gam,height,width);