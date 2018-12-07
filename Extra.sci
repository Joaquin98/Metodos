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

// Ver si an -> 0, sino diverge
// Division an+1/an 1: nose <1: converge >1: diverge
// Probar telescopica
// Geometrica
// Comparacion c.bn>an
// raiz n, ingual division

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






















