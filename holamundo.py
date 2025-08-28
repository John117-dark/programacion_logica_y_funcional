#print("Hola Mundo")
hola="Hola mundo"
#print(hola[-1])
arreglo=[]

for x in range(0,5):
    entrada = input("Introduce el numero ")
    if entrada == "":
        print("Numero no valido")
    elif int (entrada)<1:
        print("Inserta un numero positivo")
    else:
        arreglo.append(int(entrada))

print(arreglo)

def sumar(lista):
    resultado = 0
    for x in lista:
        resultado += x

    return resultado

print(f"El resultado es: {sumar(arreglo)}")
r1 = sumar (arreglo) ** 5
print(f"Potencia {r1}")

r2 = sumar(arreglo) // 3
print(f"Division {r2}")

r3 = sumar(arreglo) % 2
print(f"Residuo {r3}")