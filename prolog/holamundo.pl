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

% progenitor(X,ana), progenitor(Y,X), progenitor(Y,Z).
% Es ana tia de jaime?
% Es ana tia de isabel?