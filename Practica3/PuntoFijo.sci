// Punto Fijo:
// - Puede no converger.

// x0: Estimación inicial de la raíz
// f: funcion a la que se le busca raíz
// df: derivada de f
// e: tolerancia
// it: numero de iteraciones máximas
// it < 0 lo desactiva

function y = raiz_punto_fijo(x0,f,ex,ef,it)
    
    x = f(x0)
    cont = 0
    
    while abs(x-x0) > ex & abs(f(x)) > ef & cont <> it
        x0 = x
        x = f(x)   
    end
    
    y = x
    
endfunction


// -------------------- EJEMPLOS ----------------------------- //


function y = a(x)
    y = sin(x) - ((x*x)/2)
endfunction

function y = b(x)
    y = %e **(-x) - (x**4)
endfunction

function y = c(x)
    y = log2(x) + 1 - x
endfunction

//function y = f(x)
//    y = (x**2)/4 - sin(x)
//endfunction




deff('y = f(x)' , 'y = (%e**x) / 3')

rA = raiz_punto_fijo(0,f,10**(-5),10**(-5),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f\n",rA,f(rA))

deff('y = g(x)' , 'y = ((%e**x) - x) / 2')

rA = raiz_punto_fijo(0,g,10**(-5),10**(-5),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f\n",rA,f(rA))

deff('y = h(x)' , 'y = log(3*x)')

rA = raiz_punto_fijo(2.7,h,10**(-5),10**(-5),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f\n",rA,f(rA))

deff('y = s(x)' , 'y = (%e**x) - 2*x')

rA = raiz_punto_fijo(0,s,10**(-5),10**(-5),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f\n",rA,f(rA))
