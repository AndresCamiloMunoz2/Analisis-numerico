def funcion(x,y,redondeo):
    return round(x**y,redondeo)
def raizenesima(numero, ind, redondeo, intervalo1, intervalo2):
    if(numero==1):
        return 1
    valor=round((intervalo1+intervalo2)/2, redondeo)
    resultado=funcion(valor, ind, redondeo)
    if(abs(numero-resultado)<=1*(10**-4)):
        return valor
    else:
        if(resultado>numero):
            return raizenesima(numero, ind, redondeo, intervalo1, round((intervalo1+intervalo2)/2,redondeo))
        else:
            return raizenesima(numero,ind, redondeo,round((intervalo1+intervalo2)/2, redondeo), intervalo2)
    return valor
    
valor=float(input("Ingrese el valor del radicando, (a lo que se le calculara la raiz enesima)"))
indice=int(input("Ingrese el indice"))
intervalo1=float(input("Ingrese el intervalo derecho"))
intervalo2=float(input("Ingrese el intervalo izquierdo"))
redondeo=int(input("Ingrese el valor de la precision (ejemplo, 1(entero), 2(1 decimal), etc.)"))
print(raizenesima(valor,indice,redondeo,intervalo1,intervalo2))
