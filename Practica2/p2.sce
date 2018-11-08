function y=derivar(f,x,n,h)
    if n==0 then y=f(x)
    else y=(derivar(f,x+(h/2),n-1,h)-derivar(f,x-(h/2),n-1,h))/h
    end
endfunction

function y = horner(arr,x)
    n = length(arr);
    y = arr(1);
    for j = 2:n
        y = y*x + arr(j);
    end
endfunction

function y = reverse(arr)
    n = length(arr)
    y = (1:n)
    for i = 1:n
        y(n+1-i) = arr(i)
    end
endfunction

function y = taylor(f,n,v0,v)
    coeficientes = (1:n)
    for j = 1:n
        coeficientes(j)  = derivar(f,v0,j,0.001)/factorial(j)
        mprintf("coef: %f\n ",coeficientes(j));
    y = horner(reverse(coeficientes),v-v0) + f(v)
    end
endfunction

deff('y = f1(x)' , 'y=x**3')
deff('y = f2(x)' , 'y=%e**x')

v0=5
res=taylor(f1,2,5,v0)
vres=f1(v0)
mprintf("\n resultado: %f",res)
mprintf("\n verdadero resultado: %f",vres)
mprintf("\n vError: %f",(abs(vres-res)/vres)*100)
