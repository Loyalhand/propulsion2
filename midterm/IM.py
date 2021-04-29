def GauSei(e,w):

    # successive over-relaxation (SOR)

    # Defining equations to be solved
    # in diagonally dominant form
    f1 = lambda x,y,z: (-1+y-z)/3
    f2 = lambda x,y,z: (7+x+z)/3
    f3 = lambda x,y,z: (-7-x+y)/3

    # Initial setup
    x0 = 0
    y0 = 0
    z0 = 0
    count = 1

    # Implementation of successive over-relaxation
    print('\nCount\tx\ty\tz\n')

    condition = True

    while condition:
        x1 = (1-w) * x0 + w * f1(x0,y0,z0)
        y1 = (1-w) * y0 + w * f2(x1,y0,z0)
        z1 = (1-w) * z0 + w * f3(x1,y1,z0)
        print('%d\t%0.4f\t%0.4f\t%0.4f\n' %(count, x1,y1,z1))
        e1 = abs(x0-x1);
        e2 = abs(y0-y1);
        e3 = abs(z0-z1);
        
        count += 1
        x0 = x1
        y0 = y1
        z0 = z1
        
        condition = e1>e and e2>e and e3>e

    print('\nSolution: x = %0.3f, y = %0.3f and z = %0.3f\n'% (x1,y1,z1))