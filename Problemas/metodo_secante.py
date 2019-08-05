from pylab import *
import math

def secante(f, a, b, e):
    count = 0
    while abs(b - a) >= e:
        count += 1
        aux = b
        aux1 = (b - (f(b) * (a - b)) / (f(a) - f(b)))
        a = aux
        b = aux1
    print("Iteraciones: " + str(count))
    return b

def graph(a, b):
    x = arange(0, 20, 0.1)
    f = x * math.exp(x) - math.pi
    plot(x,f)
    grid(True)
    show()

#def f(x): return (x * math.exp(x)) - math.pi

def f(x): return (math.exp(x) - math.pi * (x))

#def f(x): return ((x**2) - 3*x - 4)

if __name__ == "__main__":
    a = float(input("Defina un punto x0: "))
    b = float(input("Defina un punto x1: "))
    e = float(input("Defina el error: "))

    print(secante(f, a, b, e))
    print(f(secante(f, a, b, e)))
