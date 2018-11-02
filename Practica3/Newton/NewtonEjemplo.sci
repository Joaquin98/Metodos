exec('Newton.sci',-1)

function y=f(x)
    y = exp(-x)-log(x);
endfunction
 
function y=df(x)
    y = -exp(-x)-1/x;
endfunction

x = raiz_newton(1,f,df,10**(-2),100)

