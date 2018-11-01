function [L,U] = doolittle (A) 
    //Reservar espacio para las matrices L y U
    // Empezando con ceros hay sitios que ya no tendremos que tocar
    L = zeros(size(A));
    U = zeros(size(A));
    [nRows, nColumns] = size(A);
    //Recorremos en orden de columnas
    for j=1:nColumns
      for i=1:nRows
        // Estamos por encima de la diagonal, hallamos elemento de U
        if i<=j
          U(i,j) = A(i,j);
          for k=1:i-1
            U(i,j) = U(i,j) - L(i,k)*U(k,j);
          end
        end    
        // Estamos por debajo de la diagonal, hallamos elemento de L
        if A(j,j)==0 then
            mprintf("Matriz no valida, retornando");
            return
        end
        if j<=i
          L(i,j) = A(i,j);
          for k=1:j-1
            L(i,j) = L(i,j) - L(i,k)*U(k,j);
          end
          L(i,j) = L(i,j)/U(j,j);
        end
      end
      end
   endfunction
   
//FUNCIONES DE REMONTE
function s1 = remote_u(A,b)
    n = size(A,1)
    x = (1:n)
    for i = n:-1:1
        temp=0;
        if i~=n then
            temp=A(i,i+1:n) * x(i+1:n)'
        end
        x(i) = (b(i) - temp)/A(i,i)
    end
    s1 = x
endfunction
 
function s1 = remote_l(A,b)
    n = size(A,1)
    x = (1:n)
    for i = 1:n
        temp=0;
        if i~=n then
            A(i,1:i-1) * x(1:i-1)';
        end
        x(i) = (b(i) - temp)/A(i,i)
    end
    s1 = x
endfunction


//A = [16,-12,8,-16;-12,18,-6,9;8,-6,5,-10;-16,9,-10,46]
//X = [4,12,-16;12,37,-43;-16,-43,98]
//AA=[1,2,3,4;1,4,9,16;1,8,27,64;1,16,81,256]
//bb=[2,10,44,190]
//
A = [1,1,0,3; 2,1,-1,1;3,-1,-1,2;-1,2,3,-1]
b = [4,1,-3,4]'
[L,U]=doolittle(A)  //MIRAR ABAJOO
y = remote_l(L,b)   //MIRAR ABAJOO
x = remote_u(U,y)   //MIRAR ABAJOO
//L*U*x' = L*y'
//Ux=b
//U*x=y
//b=y

