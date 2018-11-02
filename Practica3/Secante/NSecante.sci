// Secante:
// - Puede no converger.
// - Puede ser f'(a) = 0

// x0,x1: puntos iniciales
// f: funcion
// e: tolerancia en x
// it: numero de iteraciones máximas
// it < 0 lo desactiva

function y = raiz_secante(x0,x1,f,e,it)
    i = 0
    dif = e + 1
    while dif > e && i <> it 
        
        if(f(x1)-f(x0) == 0) then break
        end
        
        x2 = x1 - f(x1) * ((x1-x0)/(f(x1)-f(x0)))
        
        x0 = x1
        x1 = x2
        
        dif = abs(x1-x0)
        i = i + 1
    end
    
    y = x1
    
endfunction

function y = d(x)
    y = x**2 - 2*x - 3
endfunction

printf("%f",raiz_secante(1.5,2.8,d,10**(-5),10))
x = linspace(-10,10,1000)
//plot2d(x,c(x))
