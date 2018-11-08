// factQR calcula la factorizacion QR de una matriz
// Ademas, si A = [v1 ... vn], las columnas de la matriz
// Q forman una base ortonormal de <{v1, ... , vn}> obtenida
// utilizando el proceso de Gram-Schmidt.
// A puede o no ser una matriz cuadrada. En caso de que sea
// m x n, Q sera m x n y R sera n x n.

function [Q,R] = factQR (A)
    
    [nRows,nColumns] = size(A)
    Q = zeros([nRows,nColumns])
    R = zeros([nColumns,nColumns])
    // Si A no es de tango completo, no se puede factorizar QR
    if nColumns > rank(A) then
        mprintf("Matriz no valida, retornando");
        return
    end
    // Calculamos las columnas de Q como la base ortonormal de Col(A)
    // aplicando Gram-Schmidt sobre las columnas de A
    for i=1:nColumns
        // Qi = Ai
        Q(1:nRows,i) = A(1:nRows,i)
        // Qi = Ai - <Q1,Ai>*Q1 - ... - <Qi-1,Ai>*Qi-1
        for j=1:i-1
            Q(1:nRows,i) = Q(1:nRows,i) - (Q(1:nRows,j)' * A(1:nRows,i)) * Q(1:nRows,j)
        end
        // Normalizamos Qi
        Q(1:nRows,i) = Q(1:nRows,i) / norm(Q(1:nRows,i))
    end
    // Sean Q = [Q1, ... , Qn] y A = [A1, ... , An] obtenemos R como 
    // una matriz triangular superior donde R(i.j) = <Qi,Aj>
    for i=1:nColumns
        for j=i:nColumns
            R(i,j) = Q(1:nRows,i)' * A(1:nRows,j)
        end
    end
    
endfunction

// El clasico y querido remonte para hacer back-substitution
// regresiva. Dada A triangular superior y b un vector.
// Devuelve el vector x que es solucion de Ax = b.

function s1 = remote_u(A,b)
    n = size(A,1)
    x = (1:n)
    x(n) = b(n) / A(n,n)
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)')/A(i,i)
    end
    s1 = x
endfunction

////////////////////////////////////////////////////////
// -------------------- EJEMPLOS -------------------- //
////////////////////////////////////////////////////////

A = [-1,2,4;5,6,6;-3,5,9]
b = [1,2,3]
C = [0,1,1;1,1,2;0,0,3]
B = [1,0,-1;1,0,-3;0,1,1;0,-1,1]

// Resolver el sistema Ax = b con A = QR equivale a
// resolver el sistema triangular superior Rx = Q'b.
// Ademas, si x no pertenece al espacio columna de A,
// encontrar la aproximacion por minimos cuadrados de
// x equivale a resolver A'Ax = A'b o Rx = Q'b.

[Q,R] = factQR(A)

// Sea Ax=b con A=QR, luego Rx=Q'b (con R triang. sup. s/ 0s en diag.)

x = remote_u(R,Q'*b')
