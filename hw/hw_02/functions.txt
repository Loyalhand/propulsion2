import math as m 


def U(M,gamma,R,T):
   U = M*m.sqrt(gamma*R*T)
   return U

def Tau(M,gamma):
    Tau = 1+(gamma-1)/2*M**2
    return Tau

def f(Tau_l,Tau_r,Tau_c,h,cp,T_0):
    f = (Tau_l - Tau_r*Tau_c)/(h/cp/T_0 - Tau_l)
    return f 