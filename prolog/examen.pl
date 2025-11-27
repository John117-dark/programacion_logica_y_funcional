padre(fortran).
deriva(fortran,algol).
deriva(fortran,basic).
deriva(fortran,pl1).
deriva(algol,simula).
deriva(algol,clu).
deriva(clu,ruby).
deriva(basic,visualbasic).
deriva(basic,superbasic).
deriva(pl1,pls).
deriva(pl1,plc).
deriva(pl1,cpm).
deriva(pls,plsa).
deriva(plsa,plx).
deriva(simula,smalltalk).
deriva(smalltalk,objc).
deriva(smalltalk,python).
deriva(smalltalk,ruby).
deriva(smalltalk,self).
deriva(self,javascript).
deriva(smalltalk,scheme).
deriva(visualbasic,c).

% Muestre los derivados directos de Fortran Y = algol ; Y = basic ; Y = pl1
derivados_directos(X,Y) :- deriva(X,Y).

% ¿Es derivado Javascript de Self? true
es_derivado(X,Y) :- deriva(Y,X).

% ¿Es SuperBasic lenguaje hermano de VisualBasic?
lenguaje_hermano(X,Y) :- deriva(Z,X), deriva(Z,Y), X \= Y.

% Invente una regla que permita encontrar el lenguaje más "antiguo"
lenguaje_mas_antiguo(Y) :- padre(Y), \+ deriva(_,Y).

% Invente una regla que utilice una expresión aritmética
% para calcular el número de generaciones entre Fortran y un lenguaje dado.
generaciones_entre(X,Y,Generaciones) :- deriva(X,Y), Generaciones is 1.
generaciones_entre(X,Y,Generaciones) :- deriva(X,Z), generaciones_entre(Z,Y,Generaciones1), Generaciones is Generaciones1 + 1.  

% Invente una regla que utilice un comparador
es_mas_antiguo(X,Y) :- generaciones_entre(fortran,X,GenX), generaciones_entre(fortran,Y,GenY), GenX < GenY.

% ============================================
% CONSULTAS
% Muestre los derivados directos de Fortran Y = algol ; Y = basic ; Y = pl1
% ?- derivados_directos(fortran, Y).

% ¿Es derivado Javascript de Self? true
% ?- es_derivado(javascript, self).

% ¿Es SuperBasic lenguaje hermano de VisualBasic?
% ?- lenguaje_hermano(superbasic, visualbasic).

% Invente una regla que permita encontrar el lenguaje más "antiguo"
% ?- lenguaje_mas_antiguo(Y).

% Invente una regla que utilice una expresión aritmética
% para calcular el número de generaciones entre Fortran y un lenguaje dado.
% ?- generaciones_entre(fortran, ruby, Gen).

% Invente una regla que utilice un comparador
% ?- es_mas_antiguo(ruby, javascript).