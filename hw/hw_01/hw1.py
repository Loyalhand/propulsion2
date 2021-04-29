# Matthew Pahayo
# 2/5/2021
# propulsion 2 
# hw 1

import math
import sympy as sim
P_0 = sim.Symbol('P_0')

# Engine parameters and efficiencies
y = 1.4
yc = 1.4
yt = 1.32
ec = .91
et = .89
efan = .9
alpha = 3.6
M_0 = 2
T_0 = 220
PIfan = 1.64
PIc = 12
PId = 1-.015*M_0**2
PIb = .98
PIn = .99
C_pt = 1200
C_pc = 1000
h = 4.5*10**7
eta_b = .99
eta_m = .99
Tau_l = 7.3
Tau_n = 1
R = 287

# total temps and pressures between 1-4 (core)
T_t4 = Tau_l*C_pc/C_pt*T_0
T_t0 = T_0*(1+(y-1)/2*M_0**2)
T_t2 = T_t0
Tau_c = PIc**((yc-1)/(yc*ec))
T_t3 = Tau_c*T_t0
P_t0 = P_0*(1+(y-1)/2*M_0**2)**((y)/(y-1))
P_t2 = P_t0*PId
P_t3 = P_t2*PIc
P_t4 = P_t3*PIb
 
# Bypass duct
Tau_fan = PIfan**((yc-1)/yc/efan)
T_t2p = T_t0
T_t3p = Tau_fan*T_t2p
T_t9p = T_t3p
P_t2p = P_t0*PId
P_t3p = P_t2p*PIfan
P_t9p = P_t3p*PIn

# fuel air ratio [f]
f = (C_pt*T_t4-C_pc*T_t3)/(eta_b*h-C_pt*T_t4)

# turb-comp-fan balance
c = C_pc*(T_t3-T_t2)+alpha*C_pc*(T_t3p-T_t2p)
T_t5 = T_t4 - c/eta_m/(1+f)/C_pt
PIt = (T_t5/T_t4)**(yt/(yt-1)/et)
P_t5 = PIt*P_t4
P_t9 = P_t5*PIn
T_t9 = T_t5*Tau_n

# core
M_9 = math.sqrt(2/(yt-1)*((P_t9/P_0)**((yt-1)/yt)-1))
T_9 = T_t9*(1+(yt-1)/2*M_9**2)**-1
u_9 = M_9*math.sqrt(yt*R*T_9)
u_0 = M_0*math.sqrt(yc*R*T_0)

#  bypass
M_9p = math.sqrt(2/(yt-1)*((P_t9p/P_0)**((yt-1)/yt)-1))
T_9p = T_t9p*(1+(yc-1)/2*M_9p**2)**-1
u_9p = M_9p*math.sqrt(yt*R*T_9p)
u_0p = M_0*math.sqrt(yc*R*T_0)

# Specific thrust
ST = (u_9-u_0+alpha*(u_9p-u_0p))/(1+alpha)

# Specific fuel consumption
S = f/ST*10**6

print("The specific thrust is", ST, "(N.S)/kg")
print("The specific fuel consumption is", S,"mg/(N.S)" )
n = 1
while n == 1:
    n = input("Press enter to continue.")