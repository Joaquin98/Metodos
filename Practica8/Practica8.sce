function y = trapecio(f,a,b)
    h = b-a
    y = h * (f(a)+f(b))/2 
endfunction

function y = trapecio_compuesto(f,a,b,n)
    y = 0
    h = (b-a) / n
    l = a 
    for i = 1:n
        y = y + trapecio(f,l,l+h)
        l = l + h
    end
endfunction

function y = simpson(f,a,b)
    h = (b-a)/2
    y = (h/3)*(f(a) + 4*f((a+b)/2) + f(b))
endfunction

function y = simpson_compuesto(f,a,b,n)
    h = (b-a) / n
    l = a
    y = 0
    for i = 1:n/2
        y = y + f(l) + 4*f(l+h) + f(l+2*h)
        l = l + 2*h
    end
    y = y * h/3
endfunction

// Ejercicio 1

//    deff('y = a(x)','y = log(x)')
//    deff('y = b(x)','y = x**(1/3)')
//    deff('y = c(x)','y = (sin(x)**2)*x')
//
//    ta = trapecio(a,1,2), sa = simpson(a,1,2), ra = intg(1,2,a)
//    tb = trapecio(b,0,0.1), sb = simpson(b,0,0.1), rb = intg(0,0.1,b)
//    tc = trapecio(c,0,%pi/3), sc = simpson(c,0,%pi/3), rc = intg(0,%pi/3,c)    
//
//    printf("Trapecio: %f\nSimpson: %f\nSiclab: %f\n\n",ta,sa,ra)
//    printf("Trapecio: %f\nSimpson: %f\nSiclab: %f\n\n",tb,sb,rb)
//    printf("Trapecio: %f\nSimpson: %f\nSiclab: %f\n\n",tc,sc,rc)


// Ejercicio 2

    
//    deff('y = a(x)','y = x')
//    
//    deff('y = b(x)','y = x**3')
//    
//    deff('y = c(x)','y = x*((1+x**2)**(1/2))')
//    
//    deff('y = d(x)','y = sin(%pi*x)')
//    
//    deff('y = e(x)','y = x*sin(x)')
//    
//    deff('y = f(x)','y = (x**2)*(%e**x)')
    
//    ra = trapecio_compuesto(a,1,3,4), Ra = intg(1,3,a)
//    rb = trapecio_compuesto(b,0,2,4), Rb = intg(0,2,b)
//    rc = trapecio_compuesto(c,0,3,6), Rc = intg(0,3,c)
//    rd = trapecio_compuesto(d,0,1,8), Rd = intg(0,1,d)
//    re = trapecio_compuesto(e,0,2*%pi,8), Re = intg(0,2*%pi,e)
//    rf = trapecio_compuesto(f,0,1,8), Rf = intg(0,1,f)
    
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",ra,Ra,abs(Ra-ra))
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",rb,Rb,abs(Rb-rb))
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",rc,Rc,abs(Rc-rc))
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",rd,Rd,abs(Rd-rd))
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",re,Re,abs(Re-re))
//    printf("Trapecio: %f\nSiclab: %f\nError : %f\n\n",rf,Rf,abs(Rf-rf))
    
    
// Ejercicio 3

//    ra = simpson_compuesto(a,1,3,4), Ra = intg(1,3,a)
//    rb = simpson_compuesto(b,0,2,4), Rb = intg(0,2,b)
//    rc = simpson_compuesto(c,0,3,6), Rc = intg(0,3,c)
//    rd = simpson_compuesto(d,0,1,8), Rd = intg(0,1,d)
//    re = simpson_compuesto(e,0,2*%pi,8), Re = intg(0,2*%pi,e)
//    rf = simpson_compuesto(f,0,1,8), Rf = intg(0,1,f)
    
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",ra,Ra,abs(Ra-ra))
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",rb,Rb,abs(Rb-rb))
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",rc,Rc,abs(Rc-rc))
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",rd,Rd,abs(Rd-rd))
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",re,Re,abs(Re-re))
//    printf("Simpson: %f\nSiclab: %f\nError : %f\n\n",rf,Rf,abs(Rf-rf))
//    
    
    
// Ejercicio 4
    
//    deff('y =  f(x)','y = (x+1)**-1')
//    
//    r1 = trapecio_compuesto(f,0,1.5,10)
//    r2 = simpson_compuesto(f,0,1.5,10)
//    I = 0.9262907
//    printf("Trapecio: %f\nError: %f\nSimpson : %f\nError : %f\n",r1,abs(I-r1),r2,abs(I-r2))

// Ejercicio 5

    deff('y = g(x,y)','sin(x+y)')
    
    
