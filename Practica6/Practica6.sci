A1=[6,4,4,1;4,6,1,4;4,1,6,4;1,4,4,6]
A2=[12,1,3,4;1,-3,1,5;3,1,6,-2;4,5,-2,-1]

function y=autovec(A)
    autovalor=max(spec(A))
    it=100
    y=ones(size(A,1),1)
    y=[155,154,156,158]'
    for i=0:it
        aux=A*y
        y=aux/norm(aux) 
        
        lambda=((A*y)/y(1))
        lambda=lambda(1)//MAYOR AUTOVALOR
        
        disp(lambda-autovalor,"dif",i,"IT:")
        
        
        
    end
    disp(y)
endfunction
v = autovec(A1) //AUTOVECTOR DEL MAYOR AUTOVALOR
lambda=((A1*v)/v(1))
lambda=lambda(1)//MAYOR AUTOVALOR
