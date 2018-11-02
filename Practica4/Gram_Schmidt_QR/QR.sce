function [Q,R] = factQR (A)
    
    [nRows,nColumns] = size(A)
    // Si las columnas de A no son LI o no es cuadrada
    if nRows <> nColumns || nColumns > rank(A) then
        mprintf("Matriz no valida, retornando");
        return
    end
    n = nColumns
    Q = zeros([n,n])
    R = zeros([n,n])
    // Calculamos las columnas de Q como la base ortonormal de Col(A)
    // Primero aplicamos Gram-Schmidt para obtener la base ortogonal
    for i=1:n
        Q(1:n,i) = A(1:n,i)
        if i > 1 then
            for j=1:i-1
                Q(1:n,i) = Q(1:n,i) - ( (Q(1:n,j)' * Q(1:n,i)) / (Q(1:n,j)' * Q(1:n,j)) ) * Q(1:n,j)
            end
        end
    end
    // Luego dividimos cada columna de A por su norma para obtener la
    // base ortonormal
    for i=1:n
        Q(1:n,i) = Q(1:n,i) / norm(Q(1:n,i))
    end
    // Sean U = [U1, ... , Un] y A = [A1, ... , An] obtenemos R como 
    // una matriz triangular superior donde R(i.j) = <Ui,Aj>
    for i=1:n
        for j=i:n
            R(i,j) = Q(1:n,i)' * A(1:n,j)
        end
    end
    
endfunction

A = [0,1,1;1,1,2;0,0,3]
[Q,R] = factQR(A)
