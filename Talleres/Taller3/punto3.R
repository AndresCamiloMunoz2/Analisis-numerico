#Punto 3
install.packages("Matrix")#instalar paquete 
library(Matrix) 
install.packages("PolynomF")#instalar paquete 
library(PolynomF) 


lagrange = function(x,y,a){
  n = length(x)
  if(a < min(x) || max(x) < a) stop("No está interpolando")
  X = matrix(rep(x, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(y*Lnk)
}

##Puntos
x = c(0, 0.2, 0.4, 0.6, 0.8, 1)
y = c(1, 1.2214028, 1.4918247, 1.8221188, 2.2255409, 2.7182818)
#Grafica
polyAjuste = poly.calc(x,y)
plot(x,y, pch=19, cex=1, col = "red", asp=1,xlab="X", ylab="Y", main="Ejercicio 3 ")
curve(polyAjuste,add=T)


z = seq(0, 1, by = 0.001)
q = 1:length(z)
for (i in z) {
  q[i] = polyAjuste(i)
}