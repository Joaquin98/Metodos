function y=sor(A,b,t)//t tolerancia
    x = zeros(1,length(b))
    k = 0
    es = max(spec(eye(length(b),length(b))-(diag(diag(A))**-1)*A))
    w = 2/sqrt(1+sqrt(1-(es**2)))
    delta=t+1
    while k<1000 & t<delta
        aux=x
         for i = 1:length(x)
            s = 0
            for j = 1:length(x)
//                mprintf("%d , %d\n", i ,j)
                if j <> i then s = s + (A(i,j)*x(j))  
                end
            end
            x(i) = (w/A(i,i)) * (b(i) - s) + (1-w) * x(i)
         end
        k = k + 1
        delta=norm(x-aux)
    end
    printf("Cantidad de operaciones %d\n",k)
    y = x
   
endfunction
//Convergencia
//(cond necesaria) 0<w<2)
// Si A es def. pos. => converge para cualquier w \in (0,2)
