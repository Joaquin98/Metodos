function [L,U,P] = gauss(A)
    U = A
    L = eye(A)
    P = eye(A)
    m = size(A)
    m = m(1)
    for k= 1 : (m - 1)
        iMaximo = k
        for i = k : m
            if abs(U(i,k)) > abs(U(iMaximo,k)) then iMaximo = i
            end
        end
        U = swapfila(U,k,iMaximo)
        L = swapfila2(L,k,iMaximo,1,k-1)
        P = swapfila(P,k,iMaximo)
        for j = k + 1 : m
            L(j,k) = U(j,k)/U(k,k)
            U(j,k:m) = U(j,k:m) - (L(j,k)* U(k,k:m))
            U(j,k) = 0
//            L(j,k) = 0
        end
    end
endfunction
 
 
function y = swapfila(A,i,j)
    a = A(i,:)
    b = A(j,:)
    A(i,:) = b
    A(j,:) = a
    y = A
endfunction
 
function y = swapfila2(A,i,j,x,y)
    a = A(i,x:y)
    b = A(j,x:y)
    A(i,x:y) = b
    A(j,x:y) = a
    y = A
endfunction


//FUNCIONES DE REMONTE
function s1 = remote_u(A,b)
    n = size(A,1)
    x = (1:n)
    x(n) = b(n) / A(n,n)
    for i = n-1:-1:1
        x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)')/A(i,i)
    end
    s1 = x
endfunction
function s1 = remote_l(A,b)
    n = size(A,1)
    x = (1:n)
    for i = 1:n
        x(i) = (b(i) - A(i,1:i-1) * x(1:i-1)')/A(i,i)
    end
    s1 = x
endfunction
//FUNCION DE REMONTE UNIFICADA
function [x,y] = remote(L,U,b)
    y=remote_l(L,b)
    x=remote_u(U,y)
endfunction
