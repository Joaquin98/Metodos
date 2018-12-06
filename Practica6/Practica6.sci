// poly([A],"x") -> Retorna el polinomio carcaterístico.
// det(lambda*I - A) = p(lambda) Polinomio característico.
// roots(p) -> Raices del polinomio. 
// spec(A) -> Autovalores de la matriz.


function gerschgorin(A)
    n  = size(A,1)//Cambie size(A,'r') para version 5.5.2 scilab
    for i = 1:n
        suma = 0
        for j = 1:n
            if(j<>i) then suma = suma + abs(A(i,j))
            end
        end
        printf("| lambda - %0.2f | <= %0.2f \n",A(i,i),suma)
        //| lambda - (Centro) | <= (Radio)
    end
endfunction

function r = radio_espectral(A)
    r = max(abs(spec(A)))
endfunction


function l = potencia_autovalor(A,z0,it)
    
    n = length(z0)
    for i = 1:it
        w = A*z0
        z1 = w/norm(w,%inf)
        z0 = z1 
    end
    
    k = 1
    for i = 2:n
        if( abs(w(i)) > abs(w(k)))
            k = i
        end
    end
    
    l = w(k) / z0(k)
    
endfunction

function v = potencia_autovector(A,z0,it)
    
    n = length(z0)
    for i = 1:it
        w = A*z0
        z1 = w/norm(w,%inf)
        z0 = z1 
    end
 
    v = z0
    
endfunction


function l = potencia_autovalor_dif(A,z0,it)
    
    n = length(z0)
    for i = 1:it
        w = A*z0
        z1 = w/norm(w,%inf)
        z0 = z1 
        k = 1
        printf("Iteracion %d :\n",i)
        
        for i = 2:n
            if( abs(w(i)) > abs(w(k)))
                k = i
            end
        end
        
        l = w(k) / z0(k)
        disp(abs(radio_espectral(A)-l))
    end
    

    
endfunction

// Ejercicio 1

//    a = [1,0,0;-1,0,1;-1,-1,2]
//    b = [1,0,0;-0.1,0,0.1;-0.1,-0.1,2]
//    c = [1,0,0;-0.25,0,0.25;-0.25,-0.25,2]
//    d = [4,-1,0;-1,4,-1;-1,-1,4]
//    e = [3,2,1;2,3,0;1,0,3]
//    f = [4.75,2.25,-0.25;2.25,4.75,1.25;-0.25,1.25,4.75]
//    
//    printf("Matriz a: \n")
//    gerschgorin(a)
//    printf("Autovalores:")
//    disp(spec(a)')
//    printf("Matriz b: \n")
//    gerschgorin(b)
//    printf("Autovalores:")
//    disp(spec(b)')
//    printf("Matriz c: \n")
//    gerschgorin(c)
//    printf("Autovalores:")
//    disp(spec(c)')
//    printf("Matriz d: \n")
//    gerschgorin(d)
//    printf("Autovalores:")
//    disp(spec(d)')
//    printf("Matriz e: \n")
//    gerschgorin(e)
//    printf("Autovalores:")
//    disp(spec(e)')
//    printf("Matriz f: \n")
//    gerschgorin(f)
//    printf("Autovalores:")
//    disp(spec(f)')

// Ejercicio 2
// Teórico

// Ejercicio 3

//    A = [1,-1,0;-2,4,-2;0,-1,1]
//    
//    function ej3(A)    
//        e = 0.1
//        for i = 0:10
//            A(3,3) = A(3,3) + e
//            printf("\n\n\nPolinomio característico de la matriz %d:",i)
//            p = poly([A],"x")
//            disp(p)
//            printf("Raices:") 
//            disp(gsort(roots(p)))
//            printf("Autovalores:")
//            disp(gsort(spec(A)))
//        end
//    endfunction
//    
//    ej3(A)
    
// Ejercicio 4

//    A1=[6,4,4,1;4,6,1,4;4,1,6,4;1,4,4,6]
//    A2=[12,1,3,4;1,-3,1,5;3,1,6,-2;4,5,-2,-1]
//    
//    
//    printf("Matriz A1:\n\n")
//    printf("Potencia:")
//    l = potencia_autovalor(A1,[2211,1321,321,21]',100)
//    disp(l)
//    printf("Scilab:")
//    disp(radio_espectral(A1))
//    printf("A1*v:")
//    v = potencia_autovector(A1,[2211,1321,321,21]',100)
//    disp(A1*v)
//    printf("lambda * v:")
//    disp(l*v)
//    
//    printf("\n\nMatriz A2:\n\n")
//    printf("Potencia:")
//    l = potencia_autovalor(A2,[2211,1321,321,21]',100)
//    disp(l)
//    printf("Scilab:")
//    disp(radio_espectral(A2))
//    printf("A2*v:")
//    v = potencia_autovector(A2,[2211,1321,321,21]',100)
//    disp(A2*v)
//    printf("lambda * v:")
//    disp(l*v)
//    
//    potencia_autovalor_dif(A1,[5,3,12,122]',10)
