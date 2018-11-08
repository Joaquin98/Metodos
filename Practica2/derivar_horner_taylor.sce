// - f es la funcion a derivar
// - x es el punto en el que se calcula
// - n es el grado de la derivada
// - h es el intervalo de derivacion

function y=derivar(f,x,n,h)
    if n==0 then
        y=f(x)
    else
        y=(derivar(f,x+(h/2),n-1,h)-derivar(f,x-(h/2),n-1,h))/h
    end
endfunction

// Horner: evalua un polinomio p(x) = a0 + a1 * x +. . .+an * x^n
// con la iteracion bn = an y bi = ai + x0 * bi+1
// arr = [an, an-1, ... , a0]
// x es el valor donde se evalua

function y = horner(arr,x)
    n = length(arr)
    y = arr(1)
    for j = 2:n
        y = y*x + arr(j)
    end
endfunction

function y = reverse(arr)
    n = length(arr)
    y = (1:n)
    for i = 1:n
        y(n+1-i) = arr(i)
    end
endfunction

// Taylor: evalua el polinomio de Taylor de grado n de una
// funcion conociendo f(v0) para aproximar aproximando f(v)
// - f es la funcion a aproximar
// - n es el grado de la derivada
// - h es el intervalo de derivacion
// - v0 es el punto donde se conoce el valor de f
// - v es el punto donde se quiere aproximar el valor de f

function y = taylor(f,n,h,v0,v)
    coeficientes = (1:n)
    for j = 1:n
        coeficientes(j)  = derivar(f,v0,j,h)/factorial(j)
    end
    y = horner(reverse(coeficientes),v-v0) + f(v0)
endfunction

////////////////////////////////////////////////////////
// -------------------- EJEMPLOS -------------------- //
////////////////////////////////////////////////////////

deff('y = f1(x)' , 'y=x**3')
deff('y = f2(x)' , 'y=%e**x')

v0=3
res=taylor(f2,3,0.0001,2,v0)
vres=f2(v0)
mprintf("Aproximacion con Taylor: %f",res)
mprintf("\nValor verdadero de f: %f",vres)
mprintf("\nError relativo: %f",(abs(vres-res)/vres)*100)
