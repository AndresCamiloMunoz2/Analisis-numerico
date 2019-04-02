library(PolynomF)
library(Matrix)

rm(list=ls())

fx<-function(x) {
  return (exp(1)^x)
}

gx<-function(x) {
  return(1/x)
}

polinoF<-taylor(fx, 0, 4)
polinoG<-taylor(gx, 0, 4)
round(polinoF, digits = 5)
round(polinoG, digits = 5)
paraFx<-function()
{
  x <- seq(-5, 5, by = 0.5)
  
  yfuncion <- fx(x)
  ypolinomio <- polyval(polinoF, x)
  plot(x, yfuncion, type = "l", col = "red", lwd = 3, ylim = c(-10,50), ylab = "Y", xlim = c(-5,5))
  par(new = TRUE)
  plot(x, ypolinomio, type = "l", col = "blue", lwd = 3, ylim = c(-10,50), ylab = "Y", xlim = c(-5,5))
  error<- abs((ypolinomio-yfuncion)/yfuncion)
  tabla1 = data.frame(x, round(yfuncion, digits = 5),  round(ypolinomio, digits = 5), error)
  tabla1
  #min(tabla1$error)
  #polinomioResultado = poly.calc(x,ypolinomio)
  #polinomioResultado
}


paraGx<-function()
{
  x <- seq(-5, 5, by = 0.5)
  
  yfuncion <- gx(x)
  ypolinomio <- polyval(polinoG, x)
  plot(x, yfuncion, type = "l", col = "red", lwd = 2, ylim = c(-10,10), ylab = "Y", xlim = c(-5,5))
  par(new = TRUE)
  plot(x, ypolinomio, type = "l", col = "blue", lwd = 2, ylim = c(-10,10), ylab = "Y", xlim = c(-5,5))
  error <- (ypolinomio-yfuncion)/yfuncion
  tabla2 = data.frame(x, round(yfuncion, digits = 5),  round(ypolinomio, digits = 5), abs(error))
  tabla2
  
}

#paraFx()
paraGx()

