valioso(oro).
valioso(plata).
le_gusta(juan,juli).
tiene(juan,libro).
tiene(juli,libro).
% DIAGRAMA_GENEALOGICO
progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isabel).
progenitor(jose,ana).
progenitor(jose,patricia).
progenitor(patricia,jaime).
mujer(clara).

% LAS REGLAS DEVUELVEN TRUE O FALSE abuela(clara, ana).
abuela(X,Y):- progenitor(Z,Y),progenitor(X,Z), mujer(X).
 
% progenitor(X,ana), progenitor(Y,X), progenitor(Y,Z).
% Es ana tia de jaime?
% Es ana tia de isabel?


% 1- Es el gorila descendiente de hominini?

% 2- ¿Es el Homo hermano del gorila?

% 3- ¿Son el Homo y el Gorilla de la misma subfamilia?

% 4- ¿Tiene Hominini la misma familia que Pongo?

% 5- ¿Quiénes son los descendientes directos de una tribu?

% 6- ¿Cuál es la superfamilia a la que pertenece Hylobates?

% 7- ¿Qué géneros comparten la misma subfamilia con Pan?

% 8- ¿Cuál es el ancestro común mas cercano entre Homo y Gorilla?

% 9- ¿Es el orangután un homínido?

% 10- ¿Cuáles son todas las especies que pertenecen a la familia Hominidae?

% 11- ¿Qué géneros son hermanos taxonómicos de Homo?

% 12 -¿Comparten Homo y Hylobates la misma familia?

% 13- ¿Cuáles son los descendientes directos de la subfamilia Homininae?

% 14- ¿Qué géneros están bajo la familia Hominidae?

% 15- ¿Cuál es la ruta taxonómica completa desde Homo hasta la superfamilia?