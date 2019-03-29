# Punto 4
install.packages("PolynomF")#instalar paquete
library(PolynomF)

#Hallar frecuencia acumulada
x <- c(40,50,60,70,80)
y <- c(35,83,153,193,215)

datx = x[1:5]; daty = y[1:5]
polyAjuste = poly.calc(datx,daty)
polyAjuste
plot(datx,daty,pch=19, cex=1, col = "purple", asp=1) 
curve(polyAjuste,add=T) 

evaluarfuncion <- function(f, a){
  f(a)
}


polinomio <- function(x) 3343-239.3667*x+6.183333*x**2-0.06733333*x**3+0.0002666667*x**4


num <- evaluarfuncion(polinomio, 55)
print(num)
e = 120 - num
cat("Error:",round(e,3))

lagrange = function(x,y,a){
  n = length(x)
  if(a < min(x) || max(x) < a) stop("No está interpolando")
  X = matrix(rep(x, times=n), n, n, byrow=T)
  mN = a - X; diag(mN) = 1
  mD = X - t(X); diag(mD) = 1
  Lnk = apply(mN, 1, prod)/apply(mD, 2, prod)
  sum(y*Lnk)
}
cat("Resultado con Lagrange: ",lagrange(x,y,55))
print("Error nulo")