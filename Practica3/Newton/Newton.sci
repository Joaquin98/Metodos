// Newton:
// - Converge rápido
// - Puede no converger.
// - Se necesita conocer tanto 
//   f(x) como f'(x).
// - Puede que f'(x) = 0

// x0: Estimación inicial de la raíz
// f: funcion a la que se le busca raíz
// df: derivada de f
// e: tolerancia
// it: numero de iteraciones máximas
// it < 0 lo desactiva

function y = raiz_newton(x0,f,df,e,it)
    i = 0
    dif = e + 1
    while dif > e && i <> it 
        x1 = x0 - f(x0)/df(x0)
        dif = abs(x1-x0)
        x0 = x1
        i = i + 1
    end
    
    y = x1
    
endfunction
