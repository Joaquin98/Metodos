
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
converge_serie(f,100)
