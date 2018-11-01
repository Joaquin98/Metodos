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
//


function y = puntoFijo(f,x)
    x0 = x
    x = f(x)
    
    while abs(x-x0) > 10**-5
        x0 = x
        x = f(x)   
    end
    y = x
endfunction

deff('y = f(x)' , 'y = (%e**x) / 3')

printf("%f\n",puntoFijo(f,0)) 

deff('y = g(x)' , 'y = ((%e**x) - x) / 2')

printf("%f\n",puntoFijo(g,0)) 

deff('y = h(x)' , 'y = log(3*x)')

printf("%f\n",puntoFijo(h,2.7)) 

deff('y = s(x)' , 'y = (%e**x) - 2*x')

printf("%f\n",puntoFijo(s,0)) 

function y = d(x)
    y = x**2 - 2*x - 3
endfunction
