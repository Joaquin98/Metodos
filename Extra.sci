clc             // limpia la consola
clear           // borra el contenido de la memoria
xdel(winsid())  // cierra ventanas graficas

deff('y = f(x)' , 'y=x**3')
dot = 3
x=[-10:0.1:10]'; // rango a dibujar
plot(x, f(x)) // dibujo f en el rango x
plot(dot, f(dot), 'r+', 'thickness', 2) // dibujo un punto cruz roja
plot(x,zeros(1,length(x)), "black", 'thickness', 2) // dibujo el eje x ne
mprintf("%f %f",dot,f(dot)) // imprimo el valor de dot


function converge_serie(f,it)
    i = 1
    sn = 0
    while it
        sn = sn + f(i) 
        printf("Resultado %d = %f\n",i,sn)
        i = i + 1
        it = it-1
    end
endfunction

function converge_sucesion(f,it)
    i = 1
    sn = 0
    while it 
        printf("Resultado %d = %f\n",i,f(i))
        i = i + 1
        it = it-1
    end
endfunction

deff("y = f(n)","y = (-0.5)**n")
deff("y = f(n)","y = 3*(3/2)**n")
deff("y = f(n)","y = factorial(n)/2**n")
deff("y = f(n)","y = (1/2**n) - (1/3**n)")
deff("y = f(n)","y = 4**n/((n+2)*(n+4)*5**n)")
deff("y = f(n)","y = -2/(3*(n+1)**2 + 3*(n+1))")
deff("y = f(n)","y = factorial(n)/(n**n)")
deff("y = f(n)","y = (-2)/((3*n**2)+(3*n))")
//converge_sucesion(f,10)
//converge_serie(f,100)

// 1- Ver si an -> 0, sino diverge
// 2- Division an+1/an 1: nose <1: converge >1: diverge
// 3- Probar telescopica. Recordar que 1/(n*(n+k)) = (1/k)*((1/n) - (1/n+k)).
//    Si s(n) = sum(a(n)) con a(n) = b(n) - b(n+1), s(n) converge sii b(n) converge. En tal caso,
//    la suma es s(inf) = b(1) - lim(x->inf) b(n).
// 4- Geometrica. Recordar que converge solo si abs(r)<1, S(n) = (1-(r**(n+1)))/(1-r), S(inf) = 1/(1-r)
// 5- Comparacion c.bn>an
// 6- raiz n, igual division. Recordar que lim(x->inf) (n**(1/n)) = lim(x->inf) e**(ln(n**(1/n))) =
//    = lim(x->inf) e**((1/n)*ln(n)) = e**(lim(x->inf) ((1/n)*ln(n)))
//
// Recordar que la serie armonica, s(n) = sum(1/n), diverge y que 1/2 <= S(2*n) - S(n)

// Derivadas
// Funcion  Derivada
// k        0
// x        1
// ax       a
// x**n     n*(x**(n-1))
// e**x     e**x
// a**x     ln(a)*(a**x)
// ln(x)    1/x
// log(a,x) 1/(x*ln(x))
// sin(x)   cos(x)
// cos(x)   -sin(x)
// tan(x)   (sec(x))**2
// sin-1(x) 1/sqrt(1-x**2)
// cos-1(x) -1/sqrt(1-x**2)
// tan-1(x) 1/(1+x**2)
// cotg(x)  -1/(sin(x)**2) = -csc(x)**2
// sec(x)   tan(x)*sec(x)
// cosec(x) -cotg(x)*cosec(x)
// f*g      f*g' + f'*g
// f/g      (f*g' + f'*g)/g**2
// 1/f      -f'/(f**2)
// f(g(x))  f'(g(x))*g'(x)

// Integrales
// Funcion  Primitiva
// a        ax
// x**n     (x**(n+1))/(n+1)
// 1/x      ln(abs(x))
// e**x     e**x
// a**x     (a**x)/ln(x)
// ln(x)    x*ln(x) - x
// cos(x)   sin(x)
// sin(x)   -cos(x)
// sec(x)**2 tan(x)
// sec(x)   ln(abs(sec(x) + tan(x)))
// cosec(x) ln(abs(cosec(x) - cotg(x)))
// tan(x)   ln(abs(sec(x)))
// cotan(x) ln(sin(x))
//
// Integracion por partes
// integral(u*v*dx) = u*integral(v*dx) - integral(u'*integral(v*dx)*dx)
// Elegir u en el siguiente orden de prioridad: inversa trigonometrica,
// logaritmica, polinomio, trigonometrica, exponencial.

// Q1(x1) ... Qn(x1)    a1      y1
//   .  .       .       .       .
//   .    .     .       .   =   .
//   .      .   .       .       .
// Q1(xn) ... Qn(xn)    an      yn
// 
// Lagrange
//
//          n   (x -xi)
// Lk(x) = mult -------
//         i=0  (xk-xi)
//        i!=k
// 
// P(x) = L0(x)*y0 + ... + Ln(x)*yn
// P(xi) = yi
// 
// Newton
//
//     f[x1,...,xk] - f[x0,...,x(k-1)]
// D = -------------------------------
//                xk  -  x0
//
// D0
// f(x0)    D1
//          f[x0,x1]    D2              
// f(x1)                f[x0,x1,x2]     D3
//          f[x1,x2]                    f[x0,x1,x2,x3]
// f(x2)                f[x1,x2,x3]
//          f[x2,x3]
// f(x3)
// 
// P(x) = D0 + D1*(x-x0) + ... + Dn*(x-x0)*(x-x1)* ... *(x-x(n-1))
// 
// Chebyshev
// 
// xi = (b-a)/2 + ((b-a)/2)*cos( ((2*i - 1)*%pi) / 2*(n+1))
//
// Minimos cuadrados
//
// [sum(j=1,m) Q1(xj)*Qi(xj)]*a1 + ... + [sum(j=1,m) Qk(xj)*Qi(xj)]*ak = [sum(j=1,m) yj*Qi(xj)]
// m de estas ecuaciones (para m puntos y k funciones)