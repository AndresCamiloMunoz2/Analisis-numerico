library(Matrix)
library(PolynomF)
rm(list=ls())

#Punto 7 taller
#Se desea aproximar la funcion tan (x) de [-pi/2,pi/2]
#A continuacion se calculan los posibles valores para xk
#dado que pi/2 es 1.57 se escoge un numero cercano pero menor, es decir 
#1.55 y se divide entre 3 ya que el valor maximo de los puntos kx va a ser
# se toma a=0.516

#1 Utilice una interpolación polinómica y escriba el polinomio resultante.

#se arma el vector con los puntos

x=c(-1.5,-1.0,-0.5,0,0.5 ,1.0, 1.5)
y=c(-48.07,-1.66,-0.567,0,0.567,1.66,48.07)

#x=c(-1.5,-1.0,-0.5,0,0.5 ,1.0, 1.5)
#y=c(-14.10,-1.557,-0.5463,0,0.5463,1.557,14.10)

plot(x,y, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Diagrama ")

Ajuste=poly.calc(x,y)
Ajuste

#2 A continuacion se grafican los puntos del polinomio resultante
Poli<-function(x) 3.739463*x - 12.56863*x^3 + 9.956601*x^5 
Fx<-function(x) tan(x)
xi<- seq(-1.55 ,1.55, length=100)
yi<-Poli(xi)
yii<-Fx(xi)
plot(xi, yi, type = "l", col = "green", lwd = 3)
lines(xi, yii, type = "l", col = "blue", lwd = 3)
#se compara con la tangente

#lagrange
x1<- seq(-1.5 ,1.5, length=150)
Interpol <- barylag(x, y, x1)
y1<-Poli(x1)
e<-(y1-Interpol)/Interpol
lines(x1, Interpol, col="red")
lines(x1, y1, col="purple")
cat(" Error=",e,"\n")
#Error max 0.94
#se calcula un a 