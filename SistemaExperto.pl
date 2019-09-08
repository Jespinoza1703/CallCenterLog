:- consult("./BaseDeDatos.pl").

:- dynamic(respuestas/1).


%Referencias Libro Prolog

%problemas de monitor....
problema(monitor,monitorSinLuz):-
	negacion(monitorConectado),!.
problema(monitor,monitorConexiones):-
	afirmacion(monitorInterruptorFP),
	negacion(monitorCableConectado),!.
problema(monitor,monitorEncenderInterruptor):-
	negacion(monitorInterruptorFP),!.
problema(monitor,monitorPuertoCableMalo):-
	afirmacion(monitorConectado),
	afirmacion(monitorCableConectado),
	afirmacion(monitorInterruptorFP),!.
	
%problemas de teclado

problema(teclado,tecladoConecteCable):-
	afirmacion(tecladoConCable),
	negacion(tecladoCanectado),!.
	
problema(teclado,tecladoBateriaNueva):-
	negacion(tecladoConCable),
	afirmacion(tecladoSinCaBle),
	negacion(tecladoBateria),!.
	
problema(teclado,tecladoLimpielo):-
	afirmacion(tecladoConectado),
	afirmacion(tecConCable),
	afirmacion(tecladoLuz),
	afirmacion(tecladoControlador),	
	negacion(tecladoSucio),!.
problema(teclado,tecladoConecteUSB):-
	negacion(tecladoConCable),
	negacion(tecladoSinCaBle),
	afirmacion(tecladoControlador),!.
problema(teclado,tecladoCompreTeclado):-
	afirmacion(tecladoConectado),
	afirmacion(tecConCable),
	afirmacion(tecladoLuz),
	afirmacion(tecladoControlador),
	negacion(tecladosucio),!.
problema(teclado,tecladoCompreTeclado):-
	afirmacion(tecladoSinCaBle),
	afirmacion(tecladoBateria),
	negacion(tecladoSucio),!.
	
%problemas de parlante
	
problema(parlante,parlanteConecteCorriente):-
	negacion(parlanteConectado),!.
problema(parlante,parlanteConecteJack):-
	afirmacion(parlanteConCable),
	afirmacion(parlanteConectado),
	negacion(parlanteJack),!.
problema(parlante,parlanteLimpielos):-
	negacion(parlanteSucio),!.
problema(parlante,parlanteCargueParlante):-
	negacion(parlanteConClable),
	afirmacion(parlanteConexion),
	negacion(parlanteSucio),
	negacion(parlanteBateria),!.
problema(parlante,parlantesConecteABluetooh):-
	afirmacion(parlanteBateria),
	negacion(parlanteConexion),!.

%problemas de mouse
problema(mouse,conecte):-
	negacion(mouseCable),
	negacion(conCable),!.
problema(mouse,cableMalo):-
	afirmacion(conCable),
	afirmacion(controlador),
	negacion(revCable),!.
problema(mouse,sinBateria):-
	afirmacion(usbInhalambrico),
	afirmacion(controlador),
	negacion(bateria),!.
problema(mouse,actualizaControlar):-
	negacion(controlador),!.

problema(mouse,conecteUSB):-
	negacion(usbInhalambrico),!.

	
%problemas de impresora
problema(impresora, imp_sin_elec):-
    negacion(imp_con_elec), !.
problema(impresora,no_drivers):-
    afirmacion(prim_vez),
    negacion(drivers), !.
problema(impresora,imp_sin_inter):-
    afirmacion(wifi),
    negacion(imp_con_inter), !.
problema(impresora,sin_tinta):-
    negacion(tinta), !.
problema(impresora,mal_cable):-
    negacion(cable), !.
problema(impresora,componente_malo):-
    afirmacion(liquido),
    afirmacion(imp_con_elec),
    negacion(enciende), !.
problema(impresora,sucia):-
    afirmacion(sonido),
    negacion(polvo), !.
problema(impresora,cambio_papel):-
    afirmacion(sonido),
    negacion(papel), !.
problema(impresora,sucia):-
    afirmacion(imp_borrosa),
    negacion(polvo), !.
problema(impresora,desalineado):-
    afirmacion(imp_borrosa),
    afirmacion(cabezales), !.
problema(impresora,mensaje):-
    afirmacion(errores),
    afirmacion(pantalla_mensajes), !.
problema(impresora,alarmas):-
    afirmacion(errores),
    afirmacion(alarmas_leds), !.
problema(impresora,sin_resp).



%----------------Negacion/afirmacion--------------
negacion(PC):-
    respuestas(L),
    busquedaDeRespondido(PC, R, L), !,
    consultar_aux(no, R).
negacion(PC):-
    pregunta(PC, P),
    consultar_no(PC, P).
afirmacion(PC):-
    respuestas(L),
    busquedaDeRespondido(PC, R, L), !,
    consultar_aux(si, R).

afirmacion(PC):-
    pregunta(PC, P),
    consultar_si(PC, P).
    

%--------------------consultar-----------------

consultar_no(PC, P):-
    write(P), nl,
    read(R), nl,
    respuestas(L),
    union(L, [PC, R], NL),
    retractall(respuestas(_)),
    assert(respuestas(NL)),
    consultar_aux(no, R).

consultar_si(PC, P):-
    write(P), nl,
    read(R), nl,
    respuestas(L),
    union(L, [PC, R], NL),
    retractall(respuestas(_)),
    assert(respuestas(NL)),
    consultar_aux(si, R).

consultar_aux(R, R).


%Inicio de preguntas
inicializar(X):-
    write("Es un gusto ayudarle, responda Unicamente  con un SI, NO las  siguientes Preguntas:"), nl,
    retractall(respuestas(_)),
    assert(respuestas([])),
    problema(X,P),
    respuesta(P, R),
    write(R), nl.



union([], L, L).
union([X|C1], L2, [X|C2]):-
    union(C1, L2, C2).
    
    

busquedaDeRespondido(P, R, [P, R|_]).
busquedaDeRespondido(P, R, [_|C]):-
    busquedaDeRespondido(P, R, C).



