// ------ LAGRANGE ------ 

function y = L(k,x,xi)
    y = 1
    for i = 1:length(xi)
        if k<>i
            y = y * ( (x-xi(i)) / (xi(k)-xi(i)) )
        end
    end
endfunction
 
function y = lagrange_poly(x,xi,yi)
    y = 0
    for i = 1:length(xi)
        y = y + L(i,x,xi) * yi(i)
    end
endfunction

// ------ NEWTON ------  

function y = fi(x,xi,varargin)
    if length(varargin) == 0 then n = length(xi)
    else n = varargin(1)
    end
    y = 1
    for i = 1:n
//        disp(xi,i,xi(i))
        y = y * (x-xi(i))
    end
endfunction

function y = dfi(k,xi)
    y = 1
    for i = 1:length(xi)
        if i<>k
            y = y * (xi(k) - xi(i))
        end
    end
endfunction

function D = diferencias_divididas(xi,yi)
    n = length(yi)
    for i = 1:n
        D(i,1) = yi(i)
    end
    
    for i = 2:n
        for j = 1:n-(i-1)
            D(j,i) = (D(j+1,i-1) - D(j,i-1)) / ( xi(j+i-1) - xi(j) )
        end
    end
endfunction

function y = newton_poly(x,xi,yi)
    D = diferencias_divididas(xi,yi)
    n = length(xi)
    y = yi(1)

    for i = 2:n
        y = y + fi(x,xi,i-1)*D(1,i) 
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

function s1 = remonte_u(A,b)
    n = size(A,1)
    x = (1:n)
    x(n) = b(n) / A(n,n)
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)')/A(i,i)
    end
    s1 = x
endfunction

function coef = minimos_cuadrados_remonte(xi,yi,funciones)
    M = matriz(xi,funciones)
    [Q,R] = qr(M,"e")
    coef = remonte_u(R,Q'*yi)
endfunction

// ------ ERRORES ------ 

function y = cota_error_interpolacion(x,xi,fcmax)
    n = length(xi)
    y = abs((fi(x,xi)/factorial(n)) * fcmax)
endfunction

function y = error_minimos_cuadrados(coef,xi,yi,funciones)
    n = length(xi)
    y = 0
    for i = 1:n
        y = y + (P(xi(i),coef,funciones) - yi(i)) **2
    end
endfunction

// ------ CHEBYSHEV ------ 

function y = Tn(x,n)
    T = zeros(1,n+1)
    T(1) = 1
    T(2) = x
    for i = 3:n+1
        T(i) = 2*x*T(i-1) - T(i-2)
    end
    y = T(n+1)
endfunction

//x = linspace(-1,1,1000)
//y = zeros(1,length(x))
//for i = 1:length(x)
//    y(i) = Tn(x(i),40)
//end 
//plot(x,y')

function P = Chebyshev(n)
    T1 = zeros(1,n+1)
    T2 = zeros(1,n+1)
    T1(1) = 1
    T2(2) = 1
    for i = 2:n
        Taux = T2
        i = n+1
        while i<>1
            T2(i) = T2(i-1)*2
            i = i-1
        end
        T2(1) = 0
        T2 = T2 - T1
        T1 = Taux
    end
    if n==0 then T = T1
    else T = T2
    end
    P = poly(T,"x","coeff")
endfunction


//x = linspace(-1,1,1000)
//y = zeros(1,length(x))
//P = Chebyshev(5)
//for i = 1:length(x)
//    y(i) = horner(P,x(i))
////    y(i) = fi(x(i),roots(P))
//end 
//plot(x,y)
//disp(roots(P))

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
//    // Mismo error ya que es el mismo polinomio.
//
//    cotaErrorC = (fi(1/3,xi)/factorial(4))*1.8221    
//    cotaErrorL = abs(fi(1/3,xi(2:3))/factorial(2)*1.4918)
////  cotaErrorC = cota_error_interpolacion(1/3,xi,1.8221)
////  cotaErrorL = cota_error_interpolacion(1/3,xi(2:3),1.4918)
//    printf("Cota del error lineal: %f\n",cotaErrorL)
//    printf("Cota del error cubica: %f",cotaErrorC) 

// Ejercicio 2

//     Al ver la formula del error para f(x)-P(x), vemos que f(n+1)(x) = 0
//     ya que el grado de f es <= n por lo tando el error es 0 para todo x
//     con lo cual la inrtepolación es exacta.

// Ejercicio 5

////    f(0) = 2*0 + 1 = 1
////    f(1) = 2*1 + 1 = 3
////    f(2) = 2 + 1 = 3
////    
////    P1,2,3(2.5) = 3
////    Entonces:
////    
////    ((2.5-2)*(2.5-3)*3)/((1-2)*(1-3)) + ((2.5-1)*(2.5-3)*3)/((2-1)*(2-3))
////    + ((2.5-1)*(2.5-2)*f(3)/((3-1)*(3-2)) =  3
////    
////    -3/8 + 18/8 + 3/8 * f(3) = 24/8 => f(3) = 3
//    
//    xi = [0,1,2,3]
//    yi = [1,3,3,3]
//    
//    disp(lagrange_poly(2.5,xi,yi))

// Ejercicio 6
    
//    xi = [-1,1,2,4]
//    deff("y = f(x)","y = 2 + fi(x,xi,1) + -2 * fi(x,xi,2) + 2 * fi(x,xi,3)")
//    r = f(0)
//    cotaErrorC = abs((fi(0,xi)/factorial(4))*33.6)
    
    
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
//    coef3 = minimos_cuadrados_remonte(xi,yi,funciones3)
//    deff('y = f3(x)','y = P(x,coef3,funciones3)')
//    funciones2 = list(P0,P1,P2)
//    coef2 = minimos_cuadrados_remonte(xi,yi,funciones2)
//    deff('y = f2(x)','y = P(x,coef2,funciones2)')
//    funciones1 = list(P0,P1)
//    coef1 = minimos_cuadrados_remonte(xi,yi,funciones1)
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

// Ejercicio 9

//    deff("y = f(x)","y = 1/(1+x**2)")
//    
//    xi = linspace(-5,5,2)'
//    yi = f(xi)'
//    subplot(231)
//    x = linspace(-5,5,50)
//    plot(x,lagrange_poly(x,xi,yi))
//    scatter(xi,yi,"red")
//    
//    xi = linspace(-5,5,4)'
//    yi = f(xi)'
//    subplot(232)
//    x = linspace(-5,5,50)'
//    for i = 1:length(x)
//        y(i) = lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y)
//    scatter(xi,yi,"red")
//    
//    xi = linspace(-5,5,6)'
//    yi = f(xi)'
//    subplot(233)
//    x = linspace(-5,5,50)'
//    for i = 1:length(x)
//        y(i) = lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y)
//    scatter(xi,yi,"red")    
//    
//    xi = linspace(-5,5,10)'
//    yi = f(xi)'
//    subplot(234)
//    x = linspace(-5,5,50)'
//    for i = 1:length(x)
//        y(i) = lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y)
//    scatter(xi,yi,"red")
//        
//    xi = linspace(-5,5,14)'
//    yi = f(xi)'
//    subplot(235)
//    x = linspace(-5,5,50)'
//    for i = 1:length(x)
//        y(i) = lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y)
//    scatter(xi,yi,"red")
//    
//    xi = linspace(-5,5, 14)'
//    yi = f(xi)'
//    subplot(236)
//    x = linspace(-5,5,50)'
//    for i = 1:length(x)
//        y(i) = f(x(i)) - lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y)




// Ejercicio Parcial 2014

//    deff('y = f1(x)','y = 1')
//    deff('y = f2(x)','y = cos(2*%pi*x)')
//    xi = [0,0.25,0.5,0.75]'
//    yi = [2,1,0,1]'
//    funciones = list(f1,f2)
//    coef1 = minimos_cuadrados_remonte(xi,yi,funciones)
//    deff('y = f1(x)','y = P(x,coef1,funciones)')
//    err = error_minimos_cuadrados(coef1,xi,yi,funciones)
//    printf("Error : %f \n",err)
//    x = linspace(-1,2,100)
//    subplot(221)
//    plot(x,f1(x))
//    scatter(xi,yi,"red")


//    xi = [-1,0,1,2,3]
//    yi = [3,0,-1,1,2]
//    
//    x = linspace(-2,5,100)
//    subplot(221)
//    for i = 1:length(x)
//        y(i) = lagrange_poly(x(i),xi,yi)
//    end
//    plot(x,y,"red")
//    plot(xi,yi,"o")
