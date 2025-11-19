%suma
ejemplo_suma(X,Y,R) :- R is X+Y.
%resultado: ejemplo_suma(10.2,2,R)

%resta
resta(X,Y,R) :- R is X-Y.

%multiplicacion
multiplicacion(X,Y,R) :- R is X*Y.

%division real y entera
division_real(X,Y,R) :- R is X/Y.
division_entera(X,Y,R) :- R is X div Y.

%Resto de la division
resto(X,Y,R) :- R is X mod Y.

%X elevado a la Y
elevado(X,Y,R) :- R is X^Y.

%Negacion
negacion(X,Y,R) :- R is -X.

%Valor absoluto