// Falsa Posicion:
// - Convergencia garantizada.
// - Convergencias superlineal.


// - a y b extremos tal que f(a)f(b) < 0
// - f: función continua 
// - e: tolerancia del error en x , e > 0
// - it: cantidad maxima de iteraciones
// - it < 0 lo desactiva.

function y = raiz_falsa_posicion(a,b,f,e,it)
    
    c = b - f(b) * ((b-a)/(f(b)-f(a)))
    cont = 0
    while abs(b-c) > e && cont <> it 
         r = f(c)
         
         if r == 0 then break
         end
         
         if r * f(b) < 0 then  a = c
         else b = c
         end
         
         c = b - f(b) * ((b-a)/(f(b)-f(a)))
         cont = cont + 1
    end
    y = c 
    
endfunction


// a(x) = sen(x) - x^2/2

function y = a(x)
    y = sin(x) - ((x*x)/2)
endfunction

// b(x) = e^(-x) - x^4

function y = b(x)
    y = %e **(-x) - (x**4)
endfunction

// c(x) = log2(x) + 1 - x

function y = c(x)
    y = log2(x) + 1 - x
endfunction

// d(x) = x^2 - 2x - 3

function y = d(x)
    y = x**2 - 2*x - 3
endfunction

// f(x) = x^2/4 - sen(x)

function y = f(x)
    y = (x**2)/4 - sin(x)
endfunction

// g(x) = x^2 - 4 - e^(-x)

function y = g(x)
    y = (x**2) - 4 - %e**(-x)
endfunction

mprintf("%f",raiz_falsa_posicion(-2,4,g,10**(-5),100))

// Graficar las funciones:
//x = linspace(-10,10,1000)
//plot2d(x,c(x))
