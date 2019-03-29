

M = c(seq(-pi/2, pi/2, pi/6))
R = c(tan(M))
tablaDatos = data.frame(M,R)
tablaDatos
plot(M,R,pch=18, cex=1,col = "red",xlim=c(-pi/2,pi/2),xlab="X", ylab="Y")
par(new = TRUE)
resultado = poly.calc(M,R)
resultado

#B
tabla = data.frame(seq(-pi/2, pi/2, pi/10),resultado(seq(-pi/2, pi/2, pi/10)))
tabla
par(new = TRUE)
plot(tabla, pch=20, cex=1,col = "blue",xlab = 'X', ylab = 'Y',xlim=c(-pi/2,pi/2), ylim=c(resultado(-pi/2),resultado(pi/2)))
par(new = TRUE)
curve(resultado,from =-pi/2, to = pi/2,xlab="X", ylab="Y", ylim=c(resultado(-pi/2),resultado(pi/2)),main="Interpolación")

#C
f <- function(x)
{               #declaramos un objeto de tipo 'closure' (una funcion
  #que regresa una funcion) para poder reutilizar el codigo
  #y de paso la vectorizamos
  #x (vector-double): punto en el cual evaluar la funcion 
  mapply(sin, x)  #regresamos el valor de la funcion en el vector 
  
}
oneLagrange_pol <- function(dataX, index, x)
{
  #dataX (vector-double): puntos donde se conoce la funcion
  #index (int): numero que indica que termino estamos calculando
  #x (double): punto en el que se evalua el polinomio
  L_i <- 1.                   #inicializamos el coeficiente del i-esimo termino
  for(i in 1:length(dataX))
  {
    if(i != index)
    {
      #evaluamos el coeficiente de 
      L_i <- L_i*( (x - dataX[i] )/(dataX[index] - dataX[i]) )
    }
  }
  
  return(L_i)  #regresamos el coeficiente index-esimo 
}
Eval_pLagrange <- function(dataX, dataY, x)
{
  #dataX (vector-double): puntos donde se conoce la funcion
  #dataY (vector-double): puntos donde se conoce el valor de la funcion
  #x (double): punto en el que se evalua el polinomio
  f_aprox <- 0.         #inicializamos el polinomio
  for(i in 1:length(dataX))
  {
    #calculamos iterativamente el polinomio de Laprange
    f_aprox <- f_aprox + dataY[i]*oneLagrange_pol(dataX, i, x)
  }
  return(f_aprox)  #regresamos el valor del polinomio en el punto
}  
Lagrange <- function(dataX, dataY, m, a, b )
{
  #dataX (vector): puntos a evaluar donde se conoce la funcion
  #dataY (vector): valor de la funcion conocida en los puntos dataX
  #m (int):       numero de valores a evaluar
  #a,b (double): limite inferior y superior del dominio a interpolar
  
  soporte <- seq(a, b, length = m)   #construimos puntos para probar la                                                                 #interpolacion
  f_soporte <- soporte*0             #reservamos memoria para guardar los                                                               #valores interpolados 
  for(i in 1:length(soporte))
  {
    #para cada punto en el soporte se evalua el polinomio
    f_soporte[i] <- Eval_pLagrange(dataX, dataY , soporte[i]  )
    
  }
  return(f_soporte)      #regresamos el vector con los valores interpolados
}
par(new = TRUE)
X=seq(-pi/2,pi/2,pi/150)
Y=Lagrange(M,R,151,-pi/2,pi/2)
tablaLagrange = data.frame(X,Y)
tablaLagrange
#plot(tablaLagrange)

#error = (resultado(tablaLagrange$X)-tablaLagrange$Y)/resultado(tablaLagrange$X)
errores = data.frame(tablaLagrange$Y, resultado(tablaLagrange$X), abs(resultado(tablaLagrange$X)-tablaLagrange$Y))
errores
max(errores$abs.resultado.tablaLagrange.X....tablaLagrange.Y.)
max
which.max(errores$abs.resultado.tablaLagrange.X....tablaLagrange.Y.)
#max(errores$error)
#n = which.max(errores$error) 

#filaMaxE = tablaLagrange[n,]
#filaMaxE 
#valorMax = filaMaxE$Y
#interpolaX = resultado(filaMaxE$X)
#interpolaX


#errorDisminuido = abs(interpolaX - valorMax)
#errorDisminuido
