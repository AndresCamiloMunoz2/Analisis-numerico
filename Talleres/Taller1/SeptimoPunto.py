def evaluar( valorX ):
    resultado = valorX **3 + 4 * valorX
    return resultado

print ("Ingrese el error que desea: ")
error = input()
print ("Ingrese el valor inicial del intervalo: ")
valorInicial = input()
print ("Ingrese el valor final del intervalo: ")
valorFinal = input()
valorFinal = float(valorFinal)
valorInicial = float(valorInicial)
error = float(error)
incremento = (valorFinal-valorInicial)/10
if(evaluar(valorInicial) * evaluar(valorFinal) < 0)
    while incremento > error:
        if evaluar(valorInicial) > 0:
          while evaluar(valorInicial) > 0:
                valorInicial = valorInicial + incremento
            valorInicial = valorInicial - incremento
            incremento = incremento/10    
        else:
            while evaluar(valorInicial) < 0: 
                valorInicial = valorInicial + incremento
            valorInicial = valorInicial - incremento
            incremento = incremento/10
    print ("El valor en el que la función da 0 es: ", valorInicial, " con un error de: ", error)
else:
print("No hay raíz en el intervalo.")
