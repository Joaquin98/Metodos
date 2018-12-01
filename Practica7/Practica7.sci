// ------ LAGRANGE ------ 

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

// ------ NEWTON ------  

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

// ------ MINIMOS CUADRADOS ------ 

function M = matriz(x,funciones)
    p = length(funciones)
    M = zeros(length(x),p)
    for i = 1:p
        M(:,i) = funciones(i)(x)
    end
endfunction

function y = P(x,coef,funciones)
    y = 0
    for i = 1:length(coef)
        y = y + coef(i) * funciones(i)(x)
    end
endfunction

function coef = minimos_cuadrados(xi,yi,funciones)
    M = matriz(xi,funciones)
    [Q,R] = qr(M,"e")
    coef = inv(R)*Q'*yi
endfunction


// Ejercicio 1

//    // Para que sea lineal, usamos solo dos de los puntos.
//    xi = [0.2,0.4]
//    yi = [1.2214,1.4918] 
//    printf("Lineal:\n")
//    r = newton_poly(1/3,xi,yi)
//    printf("Error Newton : %f\n",abs(r-1.3956612425))
//    r = lagrange_poly(1/3,xi,yi)
//    printf("Error Lagrange : %f\n",abs(r-1.3956612425))
//    
//    // Para que sea cubica, usamos los cuatro puntos.
//    xi = [0,0.2,0.4,0.6]
//    yi = [1.0,1.2214,1.4918,1.8221]
//    
//    printf("Cubica:\n")
//    r = newton_poly(1/3,xi,yi)
//    printf("Error Newton : %f\n",abs(r-1.3956612425))
//    r = lagrange_poly(1/3,xi,yi)
//    printf("Error Lagrange : %f\n",abs(r-1.3956612425))
//    // Son el mismo polinomio por lo tanto mismo error.
    
// Ejercicio 7

//    deff('y = P0(x)','y = 1')
//    deff('y = P1(x)','y = x')
//    deff('y = P2(x)','y = x**2')
//    deff('y = P3(x)','y = x**3')
//    
//    xi = [0,0.15,0.31,0.5,0.6,0.75]'
//    yi = [1,1.004,1.31,1.117,1.223,1.422]'
//    
//    funciones3 = list(P0,P1,P2,P3)
//    coef3 = minimos_cuadrados(xi,yi,funciones3)
//    deff('y = f3(x)','y = P(x,coef3,funciones3)')
//    funciones2 = list(P0,P1,P2)
//    coef2 = minimos_cuadrados(xi,yi,funciones2)
//    deff('y = f2(x)','y = P(x,coef2,funciones2)')
//    funciones1 = list(P0,P1)
//    coef1 = minimos_cuadrados(xi,yi,funciones1)
//    deff('y = f1(x)','y = P(x,coef1,funciones1)')
//    
//    x = linspace(-0.2,1,100)
//    subplot(221)
//    plot(x,f1(x))
//    scatter(xi,yi,"red")
//    subplot(222)
//    plot(x,f2(x))
//    scatter(xi,yi,"red")
//    subplot(223)
//    plot(x,f3(x))
//    scatter(xi,yi,"red")


// Ejercicio 8
    
//    deff('y = P0(x)','y = 1')
//    deff('y = P1(x)','y = x')
//    deff('y = P2(x)','y = x**2')
//    deff('y = P3(x)','y = x**3')
//    
//    xi = [4,4.2,4.5,4.7,5.1,5.5,5.9,6.3,6.8,7.1]'
//    yi = [102.56,113.18,130.11,142.05,167.53,195.14,224.87,256.73,299.5,326.72]'
//    
//    funciones3 = list(P0,P1,P2,P3)
//    coef3 = minimos_cuadrados(xi,yi,funciones3)
//    deff('y = f3(x)','y = P(x,coef3,funciones3)')
//    funciones2 = list(P0,P1,P2)
//    coef2 = minimos_cuadrados(xi,yi,funciones2)
//    deff('y = f2(x)','y = P(x,coef2,funciones2)')
//    funciones1 = list(P0,P1)
//    coef1 = minimos_cuadrados(xi,yi,funciones1)
//    deff('y = f1(x)','y = P(x,coef1,funciones1)')
//    
//    x = linspace(3,8,100)
//    subplot(221)
//    plot(x,f1(x))
//    scatter(xi,yi,"red")
//    printf("Error Grado 1: %f\n",norm(f1(xi)-yi))
//    subplot(222)
//    plot(x,f2(x))
//    scatter(xi,yi,"red")
//    printf("Error Grado 2: %f\n",norm(f2(xi)-yi))
//    subplot(223)
//    plot(x,f3(x))
//    scatter(xi,yi,"red")
//    printf("Error Grado 3: %f\n",norm(f3(xi)-yi))
