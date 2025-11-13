% --- Hechos: Relaciones directas del diagrama ---
% es_padre_de(Padre, Hijo)
es_padre_de(hominoidea, hominidae).
es_padre_de(hominoidea, hylobatidae).

es_padre_de(hominidae, homininae).
es_padre_de(hominidae, ponginae).

es_padre_de(hylobatidae, hylobates).

es_padre_de(homininae, hominini).
es_padre_de(homininae, gorillini).

es_padre_de(ponginae, pongo).

es_padre_de(hominini, homo).
es_padre_de(hominini, pan).

es_padre_de(gorillini, gorilla).

% --- Hechos: Niveles taxonómicos ---
% nivel(Grupo, Nivel)
nivel(hominoidea, superfamily).
nivel(hominidae, family).
nivel(hylobatidae, family).
nivel(homininae, subfamily).
nivel(ponginae, subfamily).
nivel(hominini, tribe).
nivel(gorillini, tribe).
nivel(homo, genus).
nivel(pan, genus).
nivel(gorilla, genus).
nivel(pongo, genus).
nivel(hylobates, genus).

% --- Reglas Generales ---

% Regla para saber si A es descendiente de B (directo o indirecto)
es_descendiente_de(A, B) :- es_padre_de(B, A).
es_descendiente_de(A, B) :- es_padre_de(C, A), es_descendiente_de(C, B).

% Regla para saber si A es ancestro de B
es_ancestro_de(A, B) :- es_descendiente_de(B, A).

% Regla para saber si A y B son hermanos (mismo padre)
son_hermanos(A, B) :- es_padre_de(Padre, A), es_padre_de(Padre, B), A \= B.

% Regla para encontrar el ancestro de un Nivel específico (ej. "family")
ancestro_de_nivel(Descendiente, Nivel, Ancestro) :-
    es_ancestro_de(Ancestro, Descendiente),
    nivel(Ancestro, Nivel).

% Regla para saber si A y B comparten un ancestro del Nivel especificado
comparten_ancestro_de_nivel(A, B, Nivel) :-
    ancestro_de_nivel(A, Nivel, AncestroComun),
    ancestro_de_nivel(B, Nivel, AncestroComun).

% Reglas específicas para las preguntas
misma_subfamilia(A, B) :- comparten_ancestro_de_nivel(A, B, subfamily).
misma_familia(A, B) :- comparten_ancestro_de_nivel(A, B, family).

% Regla para encontrar el ancestro común más cercano
ancestro_comun(A, B, Anc) :- es_ancestro_de(Anc, A), es_ancestro_de(Anc, B).

ancestro_comun_cercano(A, B, Anc) :-
    ancestro_comun(A, B, Anc),
    \+ (ancestro_comun(A, B, OtroAnc), es_descendiente_de(OtroAnc, Anc), OtroAnc \= Anc).

% Regla para encontrar la ruta de un descendiente a un ancestro
ruta_a_ancestro(A, B, [A, B]) :- es_padre_de(B, A).
ruta_a_ancestro(A, B, [A | Ruta]) :-
    es_padre_de(Padre, A),
    ruta_a_ancestro(Padre, B, Ruta).

% 1- ¿Es el gorila descendiente de Hominini?
% ?- es_descendiente_de(gorilla, hominini).
% false.

% 2- ¿Es el Homo hermano del gorila?
% ?- son_hermanos(homo, gorilla).
% false.

% 3- ¿Son el Homo y el Gorilla de la misma subfamilia?
% ?- misma_subfamilia(homo, gorilla).
% true.

% 4- ¿Tiene Hominini la misma familia que Pongo?
% ?- misma_familia(hominini, pongo).
% true.

% 5- ¿Quiénes son los descendientes directos de una tribu?
% ?- nivel(Tribu, tribe), es_padre_de(Tribu, Descendiente).
% Tribu = hominini, Descendiente = homo ;
% Tribu = hominini, Descendiente = pan ;
% Tribu = gorillini, Descendiente = gorilla.

% 6- ¿Cuál es la superfamilia a la que pertenece Hylobates?
% ?- ancestro_de_nivel(hylobates, superfamily, SuperF).
% SuperF = hominoidea.

% 7- ¿Qué géneros comparten la misma subfamilia con Pan?
% ?- ancestro_de_nivel(pan, subfamily, SubF), ancestro_de_nivel(Genero, subfamily, SubF), nivel(Genero, genus), Genero \= pan.
% SubF = homininae, Genero = homo ;
% SubF = homininae, Genero = gorilla.

% 8. ¿Cuál es el ancestro común más cercano entre Homo y Gorilla?
% ?- ancestro_comun_cercano(homo, gorilla, Ancestro).
% Ancestro = homininae.

% 9- ¿Es el orangután un homínido?
% ?- es_descendiente_de(pongo, hominidae).
% true.

% 10- ¿Cuáles son todas las especies (géneros) que pertenecen a la familia Hominidae?
% ?- es_descendiente_de(Genero, hominidae), nivel(Genero, genus).
% Genero = homo ;
% Genero = pan ;
% Genero = gorilla ;
% Genero = pongo.

% 11- ¿Qué géneros son hermanos taxonómicos de Homo?
% ?- son_hermanos(homo, Genero), nivel(Genero, genus).
% Genero = pan.

% 12- ¿Comparten Homo y Hylobates la misma familia?
% ?- misma_familia(homo, hylobates).
% false.

% 13- ¿Quiénes son los descendientes directos de la subfamilia Homininae?
% ?- es_padre_de(homininae, Descendiente).
% Descendiente = hominini ;
% Descendiente = gorillini.

% 14- ¿Qué géneros están bajo la familia Hominidae? (Igual que la 10)
% ?- es_descendiente_de(Genero, hominidae), nivel(Genero, genus).
% Genero = homo ;
% Genero = pan ;
% Genero = gorilla ;
% Genero = pongo.

% 15- ¿Cuál es la ruta taxonómica completa desde Homo hasta la superfamilia?
% ?- ancestro_de_nivel(homo, superfamily, SuperF), ruta_a_ancestro(homo, SuperF, Ruta).
% SuperF = hominoidea,
% Ruta = [homo, hominini, homininae, hominidae, hominoidea].