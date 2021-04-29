# Matthew Pahayo
# 2/5/2021
# propulsion 2 
# hw 1

import math
# import sympy as sim
# P_0 = sim.Symbol('P_0')

P_0 = 10000
y = 1.4
yc = 1.4
yt = 1.35
ec = .9
et = .9
M_0 = 1
T_0 = 240
PIc = 20
PId = .98 
C_pt = 1098.2
C_pc = 996.5
h = 4.42*10**7
T_t4 = 1800
eta_b = 1 
eta_m = .95
PIb = .98
PIn = .99
Tau_n = 1
R = 287

T_t0 = T_0*(1+(y-1)/2*M_0**2)
T_t2 = T_t0

Tau_c = PIc**((yc-1)/(yc*ec))
T_t3 = Tau_c*T_t0

P_t0 = P_0*(1+(y-1)/2*M_0**2)**((y)/(y-1))

P_t2 = P_t0*PId

P_t3 = P_t2*PIc

f = (C_pt*T_t4-C_pc*T_t3)/(eta_b*h-C_pt*T_t4)

P_t4 = P_t3*PIb

c = C_pc*(T_t3-T_t2)
# +alpha*C_pc*(T_t3p-T_t2p)
T_t5 = T_t4 - c/eta_m/(1+f)/C_pt

PIt = (T_t5/T_t4)**(yt/(yt-1)/et)

P_t5 = PIt*P_t4

P_t9 = P_t5*PIn

T_t9 = T_t5*Tau_n

M_9 = math.sqrt(2/(yt-1)*((P_t9/11000)**((yt-1)/yt)-1))

T_9 = T_t9*(1+(yt-1)/2*M_9**2)**-1

u_9 = M_9*math.sqrt(yt*R*T_9)

u_0 = M_0*math.sqrt(yc*R*T_0)
alpha = 0
u_0p =0 
u_9p = 0 
ST = ((1+f)*u_9-u_0+alpha*(u_9p-u_0p))/(1+alpha)

S = f/ST*10**6
n = 1
while n == 1:
    n = input("Press enter to continue.")