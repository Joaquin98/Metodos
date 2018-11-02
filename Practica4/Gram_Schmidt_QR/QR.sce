function [Q,R] = factQR (A)
    
    [nRows,nColumns] = size(A)
    // Si las columnas de A no son LI o no es cuadrada
    if nColumns > rank(A) then
        mprintf("Matriz no valida, retornando");
        return
    end
    Q = zeros([nRows,nColumns])
    R = zeros([nColumns,nColumns])
    // Calculamos las columnas de Q como la base ortonormal de Col(A)
    // Primero aplicamos Gram-Schmidt para obtener la base ortogonal
    for i=1:nColumns
        Q(1:nRows,i) = A(1:nRows,i)
        for j=1:i-1
            Q(1:nRows,i) = Q(1:nRows,i) - (Q(1:nRows,j)' * A(1:nRows,i)) * Q(1:nRows,j)
        end
        Q(1:nRows,i) = Q(1:nRows,i) / norm(Q(1:nRows,i))
    end
    // Sean U = [U1, ... , Un] y A = [A1, ... , An] obtenemos R como 
    // una matriz triangular superior donde R(i.j) = <Ui,Aj>
    for i=1:nColumns
        for j=i:nColumns
            R(i,j) = Q(1:nRows,i)' * A(1:nRows,j)
        end
    end
    
endfunction

A = [0,1,1;1,1,2;0,0,3]
B = [1,0,-1;1,0,-3;0,1,1;0,-1,1]
[Q,R] = factQR(B)