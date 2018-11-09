function y = jacobi(A,b,t)//t tolerancia
   
    x = zeros(1,length(b))
    k = 0
    delta=t+1
    while k<1000 & t<delta
        xk=x
         for i = 1:length(x)
           
            s = 0
            for j = 1:length(x)
               
//                mprintf("%d , %d\n", i ,j)
                if j <> i then s = s + (A(i,j)*xk(j))  
                end
            end
            if(A(i,i)==0)
                mprintf("Matriz invalida, Cero en la diagonal")
                y=[]
                return
            end
            x(i) = (1/A(i,i)) * (b(i) - s)
           
         end
        k = k + 1
        delta=norm(x-xk)
    end
    printf("Cantidad de operaciones %d\n",k)
    y = x
endfunction
//Convergenciua:
//(condicion suficiente) A es estrictamente diag dom.
//(cond nec. y suficiente) El radio espectral de (inv(D)*(L+U)) < 1
