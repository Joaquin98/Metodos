// Newton Multivariable:
// - Supongo que converge siempre.

deff('y = f1(x)' , 'y = x(1)**2 + x(1)*x(2)**3 - 9')
deff('y = f2(x)' , 'y = 3*(x(1)**2)*x(2) - 4 - x(2)**3')

function y = fn(x)
    y(1) = f1(x(1),x(2))
    y(2) = f2(x(1),x(2))
endfunction

function y = J(x)
    y  = [2*x(1) + x(2)**3, 3*x(1)*x(2)**2 ; 6*x(2)*x(1), 3*x(1)**2 - 3*x(2)**2]
endfunction


function y = newton_multivariable(x0,f,J,e,it)
    dif = e + 1
    cant = 0
    while dif > e && cant <> it
        x1 = x0 - inv(J(x0)) * f(x0)  
        x0 = x1
        dif = abs(x1-x0)
        cant = cant + 1
    end
    
endfunction



function y = newton_multivariable_2(fn, X, N)
    Xn = X;

    mprintf("X0 = %f\n", Xn)
    for i = 1:N
      J = numderivative(f, Xn);
      J = 1/J;
      y = Xn - J*fn(Xn);
      Xn = y
      mprintf("X%d = %0.5f |-| %0.5f\n", i, Xn(1), Xn(2))
    end
endfunction

// -------------------- EJEMPLOS ----------------------------- //



x0 = [1.2,2.5]
//fn = [f1,f2]
//newton_multivariable_2(fn,x0,2)

newton_multivariable(x0,fn,J,10*(-2),100)





