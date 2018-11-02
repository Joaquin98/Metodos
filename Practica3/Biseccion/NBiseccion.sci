// Biseccion : 
// - Converge siempre, pero lento.
// - Error Acotado Garantizado.
// - Velocidad de Convergencia Garantizada.


// - a y b extremos tal que f(a)f(b) < 0
// - f: función continua 
// - e: tolerancia del error en x , e > 0
// - it: cantidad maxima de iteraciones
// - it < 0 lo desactiva.

function y = raiz_biseccion(a,b,f,e,it)
    c = (a+b)/2
    cont = 0
    while abs(b-c) > e && cont <> it 
         r = f(c)
         
         if r == 0 then break
         end
         
         if r * f(b) < 0 then  a = c
         else b = c
         end
         
         c = (a+b)/2
         cont = cont + 1
    end
    y = c 
endfunction

