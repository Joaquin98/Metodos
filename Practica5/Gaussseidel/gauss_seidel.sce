//GAUSSSEIDEL CON GAP OPCIONAL!
function y=gauss_seidel(A,b,t,gap)//t tolerancia
    [lhs,rhs]=argn(0);      //
    if rhs == 3 then        //
        gap=length(b)*2     //
    end                     //
    x = zeros(1,length(b))
    k = 0
    delta=t+1
   
    while k<1000 & t<delta
        aux=x
         for i = 1:length(x)
            s = 0
            l=max(i-gap,1)
            r=min(i+gap,length(b))
//            mprintf("\n %d %d",l,r)
            for j = l:r
//                mprintf("%d , %d\n", i ,j)
                if j <> i then s = s + (A(i,j)*x(j))  
                end
            end
            x(i) = (1/A(i,i)) * (b(i) - s)
         end
        k = k + 1
        delta=norm(x-aux)
    end
    printf("Cantidad de operaciones %d\n",k)
    y = x
   
endfunction
//EJEMPLO CON GAP 3//////////////////////////////
//N = 500
//A = 8*eye(N,N) + 2*diag(ones(N-1,1),1) + 2*diag(ones(N-1,1),-1) + diag(ones(N-3,1),3) + diag(ones(N-3,1),-3)
//b=ones(N,1)
//tic();gauss_seidel(A,b,10**-6,3);t1=toc()
///////////////////////////////////////////////
//EJEMPLO SIN GAP
//A = [1,-1,-1;1,-2,2;0,2,4]
//b = [0,0.375,0]
// 
//A1 = [1,-1,0;-1,2,-1;0,-1,1.1]
//b1 = [0,1,0]
// 
//A2 = [10,1,2,3,4;1,9,-1,2,-3;2,-1,7,3,-5;3,2,3,12,-1;4,-3,-5,-1,15]
//b2 = [12,-27,14,-17,12]
