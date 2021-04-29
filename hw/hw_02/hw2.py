# Matthew Pahayo
# 2/22/2021
# propulsion 2 
# hw 2

import functions as f
import math 

#********************************************************
# on_design analysis starts here!
#********************************************************

# initialize given values
R = 287
P_0R = 20000
mdot_R = 100
h = 4.5*10**7
gamma = 1.4
PIc_R = 15
T_T4 = 2000
T_0R = 260
M_0R = .8
cp = 1004.5
P_9R = P_0R

# Total Temperature ratios 
Tau_lR = T_T4/T_0R
Tau_cR = PIc_R**((gamma-1)/gamma)
Tau_rR = f.Tau(M_0R,gamma)
Tau_tR = 1 - Tau_rR/Tau_lR*(Tau_cR - 1)

# Total Temps [K]
T_T2R = T_0R*Tau_rR
T_T3R = T_T2R*PIc_R**((gamma-1)/gamma)

# burner Tau
Tau_bR = T_T4/T_T3R

# total temp at station 9 [K]
T_T9R = T_T4 - T_T3R + T_T2R

# Velocity of freestream [m/s]
U_0R = f.U(M_0R,gamma,R,T_0R)

# pressure ratios
PIr_R = Tau_rR**(gamma/(gamma-1)) 
PIt_R = Tau_tR**(gamma/(gamma-1))

# total pressusre by pressure at station 9
P_T9RbyP_9R = PIr_R*PIc_R*PIt_R

# Mach at station 9
M_9R = math.sqrt(((P_T9RbyP_9R)**((gamma-1)/gamma)-1)*2/(gamma-1))

T_9R = T_T9R/(1+(gamma-1)/2*M_9R**2)
U_9R = f.U(M_9R,gamma,R,T_9R)

# specific thrust
ST_R = U_9R - U_0R

# fuel flow rate 
f_R = f.f(Tau_lR,Tau_rR,Tau_cR,h,cp,T_0R)
mdot_fuelR = f_R*mdot_R

SFC_R = f_R/ST_R*10**6
# density [kg/m^3]
rho_0R = P_0R/R/T_0R
rho_9R = P_9R/R/T_9R

# area at station [m^2]
A_0R = mdot_R/rho_0R/U_0R
A_9R = mdot_R/rho_9R/U_9R

#********************************************************
# off_design analysis starts here!
#********************************************************
M = .3
T_0 = 288
P_0 = 101325
mdot_fuel = 1.215*mdot_fuelR
P_9 = P_0
Tau_t = Tau_tR
PIt = PIt_R
Tau_r = f.Tau(M,gamma)
PIr = Tau_r**(gamma/(gamma-1)) 

U_0 = f.U(M,gamma,R,T_0)

Tau_l = T_T4/T_0

Tau_c = 1 + Tau_l/Tau_r*(1-Tau_t)
PIc = Tau_c**(gamma/(gamma-1))

P_T9RbyP_9 = PIr*PIc*PIt

# Total Temps [K]
T_T2 = T_0*Tau_r
T_T3 = T_T2*PIc**((gamma-1)/gamma)

# burner Tau
Tau_b = T_T4/T_T3

# total temp at station 9 [K]
T_T9 = T_T4 - T_T3 + T_T2

# Mach at station 9
M_9 = math.sqrt(((P_T9RbyP_9)**((gamma-1)/gamma)-1)*2/(gamma-1))

T_9 = T_T9/(1+(gamma-1)/2*M_9**2)
U_9 = f.U(M_9,gamma,R,T_9)

# specific thrust
ST = U_9 - U_0
f = f.f(Tau_l,Tau_r,Tau_c,h,cp,T_0)
SFC = f/ST*10**6


G = math.sqrt(gamma)*(2/(gamma+1))**((gamma+1)/2/(gamma-1))

rho_9 = P_9/R/T_9
hi
