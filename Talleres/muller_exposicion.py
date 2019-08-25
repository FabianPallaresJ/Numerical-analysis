import math

def check(a, b):
    if f(a) * f(b) < 0:
        return True

def muller(f, x0, x1, e):
    x2 = (x0 + x1) /2
    h0 = 0
    h1 = 0
    d0 = 0
    d1 = 0
    a = 0
    b = 0
    c = 0
    error = 0 
    xaux = 0
    count = 0
    while count < e:
        print("=== It " + str(count + 1) + " ===")
        count += 1
        h0 = x1 - x0
        h1 = x2 - x1
        print("h0: " + str(h0))
        print("h1: " + str(h1))

        d0 = (f(x1) - f(x0))/(x1 - x0)
        d1 = (f(x2) - f(x1))/(x2 - x1)
        print("d0: " + str(d0))
        print("d1: " + str(d1))

        a = (d1 - d0) / (h1-h0)
        b = a * h1 + d1
        c = f(x2)

        if b < 0:
            xaux = x2 + ((-2 * c) / (b - math.sqrt((b**2)-4*a*c)))
        else:
            xaux = x2 + ((-2 * c) / (b + math.sqrt((b**2)-4*a*c)))

        x0 = x1
        x1 = x2
        x2 = xaux

        error = f(xaux)
        print("Resultado raíz = " + str(xaux))
        print("Error= " + str(error))
    print("Iteraciones: " + str(count))

#def f(x): return (x * math.exp(x)) - math.pi

def f(x): return (math.exp(-x) - x)

if __name__ == "__main__":
    x0 = float(input("Defina punto x0 del intervalo: "))
    x1 = float(input("Defina punto x1 del intervalo: "))
    e = float(input("Defina el numero en iteraciones: "))

    if(check(x0, x1)):
        muller(f, x0, x1, e)
    else:
        print("No hay raíces en este intervalo")
