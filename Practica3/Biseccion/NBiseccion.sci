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


function y = raizBiseccion(a,b,f,t,m)
    c = (a+b)/2
    while b-c>t & m 
         r = f(c)
         if r == 0 then break
         end
         if r * f(b)<0 then  a = c
         else b = c
         end
         c = (a+b)/2
         m = m - 1
    end
    y = c 
endfunction



function y = d(x)
    y = x**2 - 2*x - 3
endfunction

mprintf("%f",raizBiseccion(2,4,d,10**(-2),10))
x = linspace(-10,10,1000)
//plot2d(x,c(x))
