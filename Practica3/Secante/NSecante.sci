function y = a(x)
    y = sin(x) - ((x*x)/2)
endfunction

function y = b(x)
    y = %e **(-x) - (x**4)
endfunction

function y = c(x)
    y = log2(x) + 1 - x
endfunction

function y = f(x)
    y = (x**2)/4 - sin(x)
endfunction

function y = raizSecante(a,b,f,t,e,m)
    while abs(a-b)>t & f(b) > e & m
        if((f(b)-f(a))==0) then break
        end
        c = b - f(b) * ((b-a)/(f(b)-f(a)))
        a = b
        b = c
        m = m - 1
        //mprintf("%f",c)
    end
    y = b
endfunction

function y = d(x)
    y = x**2 - 2*x - 3
endfunction

printf("%f",raizSecante(1.5,2.5,f,10**(-5),10**(-5),10))
x = linspace(-10,10,1000)
//plot2d(x,c(x))
