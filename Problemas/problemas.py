import math

def error_redondeo():
    pass


#Polinomio de taylor con 5 cifras significativas para e^0.5
def taylor():
    print("Polinomio de taylor para e^0.5")
    grado = int(input("A qué grado desea realizar el polinomio? "))
    x = 0.5
    funct = round((math.e)**x,5)
    print ("Resultado real: " + str(funct))

    res_taylor = _doing_taylor(grado, x)

    print("Resultado aproximado: " + str(res_taylor))


def _doing_taylor(grado, x):
    
    grd = 0

    while grd <= grado:

        res = 1
        grd += 1

    return res

def polinomio():
    pass

    
def raiz_siete():
    dato = int(input("Ingrese el dato a usar: "))
    if (dato >= 0):
        error = int(input("Error permitido: "))
        vali = int(input("Valor inicial: "))
        result = 0
        
        result = (0.5 * (vali + (dato / vali)))

        while abs(vali - result) > error:
            vali = result
            result = (0.5 * (vali + (dato/vali)))

        print(round(result,5))
        print(abs(vali-result))


def welcome():
    print("\n\n===Problemas de análisis numérico===")
    print("======Seleccione el problema======")
    print("[1] Error redondeo")
    print("[2] Raiz siete")
    print("[3] Teorema de Taylor")
    print("[4] Polinomio")
    print("[s] Salir")
    print("")
    


if __name__ == '__main__':
    cont = 1

    while cont == 1:
        welcome()
        command = input()

        if command == '1':
            error_redondeo()
            break

        elif command == '2':
            raiz_siete()

        elif command == '3':
            taylor()

        elif command == '4':
            polinomio()

        elif command == 'S' or command == 's':
            cont = 0
            print("Has elegido salir del programa")

        else:
            print("Comando equivocado")


