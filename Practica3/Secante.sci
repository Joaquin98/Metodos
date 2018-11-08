// Secante:
// - Puede no converger.
// - Puede ser f'(a) = 0

// x0,x1: puntos iniciales
// f: funcion
// ex: tolerancia en x
// ef: tolerancia del error en f(x) , e > 0
// it: numero de iteraciones máximas
// it < 0 lo desactiva

function y = raiz_secante(x0,x1,f,ex,ef,it)
    cont = 0
    dif = ex + 1
    while dif > ex & abs(f(x1)) > ef & cont <> it 
        
        if(f(x1)-f(x0) == 0) then 
            mprintf("Diferencia f(x1)-f(x0) = 0 \n")
            break
        end
        
        x2 = x1 - f(x1) * ((x1-x0)/(f(x1)-f(x0)))
        
        x0 = x1
        x1 = x2
        
        dif = abs(x1-x0)
        cont = cont + 1
    end
    
    y = x1
    
endfunction




// -------------------- EJEMPLOS ----------------------------- //


function y = d(x)
    y = x**2 - 2*x - 3
endfunction

rA = raiz_secante(1.5,2.8,d,10**(-5),10**(-5),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f",rA,d(rA))
