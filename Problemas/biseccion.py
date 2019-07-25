from pylab import *
import math

def check():
    if f(a) * f(b) > 0:
        return True


def num_it():
    pass

def biseccion(a, b, e):
    while b - a >= e:
        c = (a + b) / 2
        if f(c) == 0:
            return c
        else:
            if f(a)  * f(c) > 0:
                a = c
            else:
                b = c
    return c

def graph(a, b):
    x = arange(0, -2, 2)
    f = x * math.exp(x) - math.pi
    plot(x,f)
    grid(True)
    show()

def f(x): return x * math.exp(x) - math.pi

if __name__ == "__main__":
    a = float(input("Defina punto a del intervalo: "))
    b = float(input("Defina punto b del intervalo: "))
    e = float(input("Defina el error: "))

    if(check()):
        print(biseccion(a , b, e))
    #graph(a, b)