%{
 2/22/2020
 Matthew Pahayo
 file Name: offDesign.m
%}
clc
clear all
close all

R = 287;
P_0R = 101325;
T_R = 222500;
h = 4.5*10^7;
gamma = 1.4;
PIc_R = 20
T_T4 = 1500;
T_0R = 300;
M_0R = 2;
Tau_lR = T_T4/T_0R
Tau_cR = PIc_R^((gamma-1)/gamma)
U_0R = M_0R*sqrt(gamma*R*T_0R)
Tau_rR = 1+(gamma-1)/2*M_0R^2
PIr_R = Tau_rR^(gamma/(gamma-1)) 
Tau_tR = 1 - Tau_rR/Tau_lR*(Tau_cR - 1)
PIt_R = Tau_tR^(gamma/(gamma-1))
T_T2R = T_0R*Tau_rR
T_T3R = T_T2R*PIc_R^((gamma-1)/gamma)
Tau_bR = T_T4/T_T3R
P_9R = P_0R

P_T9RbyP_9R = PIr_R*PIc_R*PIt_R

M_9R = sqrt(((P_T9RbyP_9R)^((gamma-1)/gamma)-1)*2/(gamma-1))
T_T9R = T_T4 - T_T3R + T_T2R
T_9R = T_T9R/(1+(gamma-1)/2*M_9R^2)
U_9R = M_9R*sqrt(gamma*R*T_9R)
U_0R = M_0R*sqrt(gamma*R*T_0R)
ST_R = U_9R - U_0R
mdot_R = T_R/ST_R
rho_0R = P_0R/R/T_0R
rho_9R = P_9R/R/T_9R
A_0R = mdot_R/rho_0R/U_0R
A_9R = mdot_R/rho_9R/U_9R

