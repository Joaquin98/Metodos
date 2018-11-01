function [U, ind] = Cholesky(A)
    eps = 1.0e-8
    n = size(A,1)   //creo la matriz
    U = zeros(n,n)  // nxn llena de ceros
    
        for i = 1:n
            //CALCULO PARA ELEMENTOS DE LA DIAGONAL
            t=0//uso t y el if para cuando i=0 porque sino se rompe(multiplica dos vectores nulos y cuando hace la resta explota);
            if (i-1~=0) then  t = U(1:i-1,i)'*U(1:i-1,i)
            end
            t=A(i,i)-t
            if t <= eps//si el elemento de la diagonal esta muuuy cerca de cero termina
                mprintf("Matriz no definida positiva.\n")
                ind = 0
               return
            end
            
            U(i,i)= sqrt(t)//pongo el nuevo elemento de la diagonal en la nueva matriz
            //CALCULO PARA ELEMTNOS POR DEBAJO DE LA DIAGONAL
            for j = i+1:n
                t=0//De nuevo separo con el if el caso en que i=0 (no prestar atencion)
                if (i-1~=0) then  t = U(1:i-1,i)'*U(1:i-1,j)
                end
                U(i,j) = ( A(i,j) - t )/U(i,i)//calculo de los elemntos debajo de la diaj
            end
            
        end
    ind = 1
endfunction
//EJEMPLOS
//A = [16,-12,8,-16;-12,18,-6,9;8,-6,5,-10;-16,9,-10,46]
//X = [4,12,-16;12,37,-43;-16,-43,98]
//B = Cholesky(A); a = B' * B
////C = Cholesky(X); b = C' * C
//
