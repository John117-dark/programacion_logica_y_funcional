% ============================================
% HECHOS DE LA TOPOLOGÍA DE RED
% ============================================

% RED 1 - Topología de Estrella (velocidad 1000 Mb/s)
red(red1).
velocidad_red(red1, 1000).

% Switch central de RED1
switch(switch_red1).
conectado_a_red(switch_red1, red1).

% PCs conectadas a RED1
dispositivo(pc1, pc).
dispositivo(pc2, pc).
dispositivo(pc3, pc).
dispositivo(pc4, pc).
conectado_a(pc1, switch_red1).
conectado_a(pc2, switch_red1).
conectado_a(pc3, switch_red1).
conectado_a(pc4, switch_red1).

% RED 2 - Topología (velocidad 100 Mb/s)
red(red2).
velocidad_red(red2, 100).

% Switch central de RED2
switch(switch_red2).
conectado_a_red(switch_red2, red2).

% PCs conectadas a RED2
dispositivo(pc5, pc).
dispositivo(pc6, pc).
dispositivo(pc7, pc).
dispositivo(s1, switch).
conectado_a(pc5, switch_red2).
conectado_a(pc6, switch_red2).
conectado_a(pc7, pc5).
conectado_a(s1, switch_red2).

% Conexión entre las dos redes (por el switch central)
conectado_a(switch_red1, switch_red2).

% ============================================
% 2. MOSTRAR LAS PCs DE LA TOPOLOGÍA DE ESTRELLA (RED1)
% ============================================

% Consulta: ?- pcs_red_estrella(RED1, PCs).
pcs_red_estrella(Red, PCs) :-
    findall(PC, (dispositivo(PC, pc), conectado_a(PC, Switch), conectado_a_red(Switch, Red)), PCs).

% ============================================
% 3. REGLA: ¿Un dispositivo pertenece a una red?
% ============================================

pertenece_a_red(Dispositivo, Red) :-
    conectado_a(Dispositivo, Switch),
    conectado_a_red(Switch, Red).

% Caso alternativo: si el dispositivo es un switch
pertenece_a_red(Dispositivo, Red) :-
    conectado_a_red(Dispositivo, Red).

% ============================================
% 4. ¿PUEDE EL S1 ENVIAR PING A PC2?
% ============================================

puede_hacer_ping(Origen, Destino) :-
    % Caso 1: Ambos en la misma red
    pertenece_a_red(Origen, Red),
    pertenece_a_red(Destino, Red),
    !.

puede_hacer_ping(Origen, Destino) :-
    % Caso 2: Están en redes diferentes pero hay conexión entre switches
    pertenece_a_red(Origen, Red1),
    pertenece_a_red(Destino, Red2),
    Red1 \= Red2,
    existe_ruta(Origen, Destino).

% Regla auxiliar para verificar si existe ruta
existe_ruta(Origen, Destino) :-
    conectado_a(Origen, Switch1),
    conectado_a(Destino, Switch2),
    (conectado_a(Switch1, Switch2) ; conectado_a(Switch2, Switch1)).

% ============================================
% 5. REGLA INVENTADA: Dispositivos de alto rendimiento
% ============================================

% Regla: Un dispositivo es de "alto rendimiento" si:
% - Pertenece a una red con velocidad >= 500 Mb/s
% - Es un PC (no un switch)

dispositivo_alto_rendimiento(Dispositivo) :-
    dispositivo(Dispositivo, pc),
    pertenece_a_red(Dispositivo, Red),
    velocidad_red(Red, Velocidad),
    Velocidad >= 500.

% ============================================
% 6. REGLA CON EXPRESIÓN ARITMÉTICA: Calcular latencia
% ============================================

% Latencia (ms) = 1000 / velocidad(Mb/s)
latencia_aproximada(Dispositivo, Latencia) :-
    pertenece_a_red(Dispositivo, Red),
    velocidad_red(Red, Velocidad),
    Velocidad > 0,
    Latencia is 1000 / Velocidad.

% ============================================
% 7. REGLA CON COMPARADOR: Velocidad de red suficiente
% ============================================

velocidad_suficiente(Dispositivo) :-
    pertenece_a_red(Dispositivo, Red),
    velocidad_red(Red, Velocidad),
    Velocidad > 500,
    write('El dispositivo tiene velocidad suficiente (> 500 Mb/s)'), nl.

velocidad_suficiente(Dispositivo) :-
    pertenece_a_red(Dispositivo, Red),
    velocidad_red(Red, Velocidad),
    Velocidad =< 500,
    write('El dispositivo tiene velocidad limitada (<= 500 Mb/s)'), nl.

% ============================================
% CONSULTAS DE EJEMPLO
% ============================================

% ?- pcs_red_estrella(red1, PCs).
% Respuesta: PCs = [pc1, pc2, pc3, pc4]

% ?- pertenece_a_red(pc2, red1).
% Respuesta: true

% ?- puede_hacer_ping(s1, pc2).
% Respuesta: true (hay conexión entre redes)

% ?- dispositivo_alto_rendimiento(X).
% Respuesta: X = pc1 ; X = pc2 ; X = pc3 ; X = pc4

% ?- latencia_aproximada(pc5, L).
% Respuesta: L = 10.0

% ?- velocidad_suficiente(pc1).
% Respuesta: El dispositivo tiene velocidad suficiente (> 500 Mb/s)