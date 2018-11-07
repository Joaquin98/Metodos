// Newton Multivariable:
// - Supongo que converge siempre.

function y = newton_multivariable(x0,f,J,e,it)
    dif = e + 1
    cant = 0
    while dif > e && cant <> it
        x1 = x0 - inv(J(x0)) * f(x0)  
        x0 = x1
        dif = abs(x1-x0)
        cant = cant + 1
    end
    
endfunction
