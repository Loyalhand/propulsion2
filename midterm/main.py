import IM
import math
from sympy import *
from numpy import *
from numpy import linalg as LA

x = Symbol('x')    
y = Symbol('y')
z = Symbol('z')
w = Symbol('w')

f1 = x**2 + y**2*x
f2 = y*y*y
f3 = z*z
f4 = w

f1px = f1.diff(x)
f1py = f1.diff(y)
f1pz = f1.diff(z)
f1pw = f1.diff(w)

f2px = f2.diff(x)
f2py = f2.diff(y)
f2pz = f2.diff(z)
f2pw = f2.diff(w)

f3px = f3.diff(x)
f3py = f3.diff(y)
f3pz = f3.diff(z)
f3pw = f3.diff(w)

f4px = f4.diff(x)
f4py = f4.diff(y)
f4pz = f4.diff(z)
f4pw = f4.diff(w)

A = array([[float(f1px.subs({x:10, y:1, z:1, w:1})), float(f1py.subs({x:10, y:1, z:1, w:1})), float(f1pz.subs({x:10, y:1, z:1, w:1})), float(f1pw.subs({x:10, y:1, z:1, w:1})),float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1px.subs({x:10, y:1, z:1, w:1})), float(f1py.subs({x:10, y:1, z:1, w:1})), float(f1pz.subs({x:10, y:1, z:1, w:1})), float(f1pw.subs({x:10, y:1, z:1, w:1})),float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1px.subs({x:10, y:1, z:1, w:1})), float(f1py.subs({x:10, y:1, z:1, w:1})), float(f1pz.subs({x:10, y:1, z:1, w:1})), float(f1pw.subs({x:10, y:1, z:1, w:1})),float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1px.subs({x:10, y:1, z:1, w:1})), float(f1py.subs({x:10, y:1, z:1, w:1})), float(f1pz.subs({x:10, y:1, z:1, w:1})), float(f1pw.subs({x:10, y:1, z:1, w:1})),float(f1.subs({x:10, y:1, z:1, w:1}))]])
A = reshape(A,(4,4))
b = array([[float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1.subs({x:10, y:1, z:1, w:1}))],
    [float(f1.subs({x:10, y:1, z:1, w:1}))]])
b = reshape(b,(4,1))


print('hi')

