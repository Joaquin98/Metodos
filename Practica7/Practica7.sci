function y = L(k,x,x0)
    y = 1
    for i = 1:length(x0)
        if k<>i
            y = y * ( (x-x0(i)) / (x0(k)-x0(i)) )
        end
    end
endfunction
 
function y = lagrange_poly(x,x0,y0)
    y = 0
    for i = 1:length(x0)
        y = y + L(i,x,x0) * y0(i)
    end
endfunction
 
function y = N(x,x0)
    y = 1
    for i = 1:length(x0)
        y = y * (x-x0(i))
    end
endfunction
 
function y = dN(k,x0)
    y = 1
    for i = 1:length(x0)
        if i<>k
            y = y * (x0(k) - x0(i))
        end
    end
endfunction
 
function y = newton_poly(x,x0,y0)
    y = 0
    for i = 1:length(x0)
        y = y + ( N(x) / ( (x-x0(i)) * dN(i,x0) ) ) * y0(i)
    end
endfunction
 
x0 = [0,0.2,0.4,0.6]
y0 = [1.0,1.2214,1.4918,1.8221]
 
//x0 = [0.2,0.4]
//y0 = [1.2214,1.4918] // Paea que sea lineal, usamos solo dos de los puntos
res = newton_poly(1/3,x0,y0)
