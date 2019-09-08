:-consult('BaseDeDatos.pl').
:-consult('SistemaExperto.pl').

%Referencias Libro Prolog


% Respuestas a saludos
respuestas_saludo(hola,'¿Hola, en qué puedo ayudarle?').
respuestas_saludo(buenas,'¿Hola, en qué puedo ayudarle?').
respuestas_saludo(buenos,'¿Hola, en qué puedo ayudarle?').
respuestas_saludo(como,'¿Hola, en qué puedo ayudarle?').
respuestas_saludo(saludo,'¿Hola, en qué puedo ayudarle?').
respuestas_saludo(saludos,'¿Hola, en qué puedo ayudarle?').

respuestas_despedida(muchas,'Fue un gusto atenderle.').
respuestas_despedida(gracias,'Fue un gusto atenderle.').
respuestas_despedida(hasta,'Fue un gusto atenderle.').
respuestas_despedida(adios,'Fue un gusto atenderle.').
respuestas_despedida(bye,'Fue un gusto atenderle.').
respuestas_despedida(ok,'Fue un gusto atenderle.').
respuestas_despedida(listo,'Fue un gusto atenderle.').

saludar(X):-respuestas_saludo(X,Y),write(Y).


%Referencia LibroProlog
%Sintagmas
oracion(L1, L3) :- sujeto(L1, L2), predicado(L2, L3).
oracion(L1, L3) :- overlap_saludo(L1,X), sustantivo([Y|_],L3).
sujeto(L1, L3) :- articulo(L1, L2), sustantivo(L2, L3).
predicado(L1, L3) :- atomic_list_concat(L1, "_", A), problemas(A).


%Verifica si es un saludo válido
saludo_inicial():-readLine(Line1),
	((oracion(Line1,[]),overlap_saludo(Line1,X)) -> saludar(X),!,nl;
	write("Vuelva a redactar su respuesta. Consulte el manual de usuario."),nl,start).
	
%Verifica si es una despedida válida
despedida():-readLine(Line1),
	(overlap_despedidas(Line1,X) -> respuestas_despedida(X,Y),write(Y),!,nl;
	write("Vuelva a redactar su respuesta. Consulte el manual de usuario."),nl,despedida).
	


 
%Inicio del programa. Comienzan las preguntas
start():-
	saludo_inicial, nl,
	readLine(Oracion_List),
	overlap_hardware(Oracion_List,X),
	(overlap_referencias(Oracion_List,X) -> referencia(X,M),write(M),nl,despedida,!;
	overlap_causas(Oracion_List,Y) -> causas(Y,Z),write(Z),nl,despedida,!;
	oracion(Oracion_List,[]),
	inicializar(X),
	write(X)).


%Obtiene el input del usuario y lo convierte en una lista
readLine(Line1) :-
read_line_to_codes(user_input, Codes),
atom_codes(Line, Codes),
atomic_list_concat(Line1, " ", Line), nl.
