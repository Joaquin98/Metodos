function [L,U,P] = gauss_sin_swap(A)
    U = A
    L = eye(A)
    P = eye(A)
    m = size(A)
    m = m(1)
    for k= 1 : (m - 1)
        for j = k + 1 : m
            if U(k,k)==0
                mprintf("Matriz no valida, retornando. 0 en la diagonal");
                return;
            end
            L(j,k) = U(j,k)/U(k,k)
            U(j,k:m) = U(j,k:m) - (L(j,k)* U(k,k:m))
            U(j,k) = 0
//            L(j,k) = 0
        end
    end
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

//A1 = [0,1,1,0;4,3,3,1;8,7,9,5;6,7,9,8]//0 EN LA DIAJ!
//A2 = [1,1,0,3; 2,1,-1,1;3,-1,-1,2;-1,2,3,-1]//SIN 0 EN LA DIAJ
//A3 = [2.1756,4.0231,-2.1732,5.1967; -4.0231,6.0000,0,1.1973;-1.0000,5.2107,1.1111,0;6.0235,7.0000,0,4.1561]
//A4 = [1.012,-2.132,3.104; -2.132,4.096,-7.013;3.104,-7.013,0.014]
//A5 = [1.012,-2.132,0; -2.132,4.096,-7.013;0,-7.013,0.014]
//
//b = [4,1,-3,4]'
//
//[L,U,P] = gauss_sin_swap(A1);disp(L,U)//[x,y]=remote(L,U,b);disp(A1*x')
//[L,U,P] = gauss_sin_swap(A2);[x,y]=remote(L,U,b);disp(A2*x')
//[L,U,P] = gauss_sin_swap(A3);[x,y]=remote(L,U,b);disp(A3*x')
//[L,U,P] = gauss_sin_swap(A4);[x,y]=remote(L,U,b);disp(A4*x')
//[L,U,P] = gauss_sin_swap(A5);[x,y]=remote(L,U,b);disp(A5*x')
//

