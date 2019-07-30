from pylab import *
import math


def check(a, b):
    if f(a) * f(b) < 0:
        return True


def num_it():
    pass

def triseccion(f, a, b, e):
    d = 0
    c = 0
    while b - a >= e:
        c = a + ((b - a) / 3)
        d = c + ((b - a) / 3)
        if f(c) == 0:
            return c

        elif f(d) == 0:
            return d

        else:
            if f(a) * f(c) > 0:

                if f(c) * f(d) > 0:
                    a = d
                else:
                    a = c
                    b = d
            else:
                b = c
    return d

def graph(a, b):
    x = arange(0, 20, 0.1)
    f = x * math.exp(x) - math.pi
    plot(x,f)
    grid(True)
    show()


def f(x): return (x * math.exp(x)) - math.pi

if __name__ == "__main__":
    a = float(input("Defina punto a del intervalo: "))
    b = float(input("Defina punto b del intervalo: "))
    e = float(input("Defina el error: "))

    if(check(a, b)):
        print(triseccion(f, a , b, e))
        print(f(triseccion(f, a , b, e)))
    #graph(a, b)