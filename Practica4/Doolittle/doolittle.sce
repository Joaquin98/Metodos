function [L,U] = doolittle (A) 
    //Reservar espacio para las matrices L y U
    // Empezando con ceros hay sitios que ya no tendremos que tocar
    L = zeros(size(A));
    U = zeros(size(A)(1),size(A)(2));
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
        mprintf("ACA %d %d",j,i)
        disp(U)
        if i==j&U(j,j)==0 then
            mprintf("Matriz no valida, retornando");
            return 0;
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

//A1 = [16,-12,8,-16;-12,18,-6,9;8,-6,5,-10;-16,9,-10,46]
//A2 = [4,12,-16;12,37,-43;-16,-43,98]
//A3=[1,2,3,4;1,4,9,16;1,8,27,64;1,16,81,256]
//b=[2,10,44,190]
//
//[L,U]=doolittle(A1)
//[x,y]=remote(L,U,b)



