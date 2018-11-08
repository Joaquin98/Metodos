// Newton:
// - Converge rápido
// - Puede no converger.
// - Se necesita conocer tanto 
//   f(x) como f'(x).
// - Puede que f'(x) = 0

// x0: Estimación inicial de la raíz
// f: funcion a la que se le busca raíz
// df: derivada de f
// ex: tolerancia del error en x , e > 0
// ef: tolerancia del error en f(x) , e > 0
// it: numero de iteraciones máximas
// it < 0 lo desactiva

function y = raiz_newton(x0,f,df,ex,ef,it)
    cont = 0
    dif = ex + 1
    while dif > ex & abs(f(x0)) > ef & cont <> it 
        
        if(df(x0)==0) then
           mprintf("Derivada negativa!\n")
           return 
        end
        
        x1 = x0 - f(x0)/df(x0)
        dif = abs(x1-x0)
        x0 = x1
        cont = cont + 1
    end
    
    y = x1
    
endfunction


// -------------------- EJEMPLOS ----------------------------- //


function y=f(x)
    y = exp(-x)-log(x);
endfunction
 
function y=df(x)
    y = -exp(-x)-1/x;
endfunction

rA = raiz_newton(1,f,df,10**(-2),10**(-2),100)

mprintf("Raiz Aproximada: %0.12f\nValor de la funcion en la raiz: %0.12f",rA,f(rA))
