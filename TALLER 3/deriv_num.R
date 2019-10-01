require(pracma)
require(tables)


options(digits = 5)
fx = function(x) x*cos(x)
f = function(x, h) (fx(x + h) - fx(x))/h

tol = c(0.1, 0.01, 0.0011, 0.0001)

#PUNTO A
valor_ex = c(
fderiv(fx, 1.8, n = 1, tol[1]),
fderiv(fx, 1.8, n = 1, tol[2]),
fderiv(fx, 1.8, n = 1, tol[3]),
fderiv(fx, 1.8, n = 1, tol[4]))

tab = data.frame(cbind(tol,valor_ex))
tab

aprox = c(f(1.8, tol[1]),
          f(1.8, tol[2]),
          f(1.8, tol[3]),
          f(1.8, tol[4]))

tab2 = data.frame(cbind(tol, aprox))
tab2

#PUNTO B
error_rel = c(abs(valor_ex[1]-aprox[1])/abs(valor_ex[1]),
              abs(valor_ex[2]-aprox[2])/abs(valor_ex[2]),
              abs(valor_ex[3]-aprox[3])/abs(valor_ex[3]),
              abs(valor_ex[4]-aprox[4])/abs(valor_ex[4]))

rel = data.frame(cbind(tol,error_rel))
rel

error_abs = c(abs((valor_ex[1])-aprox[1]),
              abs((valor_ex[2])-aprox[2]),
              abs((valor_ex[3])-aprox[3]),
              abs((valor_ex[4])-aprox[4]))


absol = data.frame(cbind(tol,error_abs))
absol

trunc = function(h){
  abs((h*fderiv(fx, 1.8, n=2, h))/2)
}

error_trunc = c(trunc(tol[1]),
                trunc(tol[2]),
                trunc(tol[3]),
                trunc(tol[4]))
e_trunc = data.frame(cbind(tol,error_trunc)); e_trunc

#PUNTO C
cat("El valor de h que genera precision de 10^-4 es", tol[3])

#PUNTO D

