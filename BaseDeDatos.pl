%-------------------------Base de datos gramatical -----------------------------
% Referencia LibroPROLOG


% Artículos
% arg 0 artículo
% arg 1 el resto de la lista
articulo([el|S],S).
articulo([lo|S],S).
articulo([la|S],S).
articulo([las|S],S).
articulo([los|S],S).
articulo([me|S],S).
articulo([un|S],S).
articulo([una|S],S).
articulo([se|S],S).
articulo([mi|S],S).

%Sustantivos
% arg 0 sustantivo
% arg 1 el resto de la lista
sustantivo([mouse|S],S).
sustantivo([monitor|S],S).
sustantivo([teclado|S],S).
sustantivo([case|S],S).
sustantivo([ram|S],S).
sustantivo([procesador|S],S).
sustantivo([fuente|S],S).
sustantivo([parlante|S],S).
sustantivo([pantalla|S],S).
sustantivo([headset|S],S).
sustantivo([impresora|S],S).
sustantivo([usb|S],S).
sustantivo([hdmi|S],S).
sustantivo([hdd|S],S).
sustantivo([camara|S],S).
sustantivo([cargadror|S],S).
sustantivo([bateria|S],S).
sustantivo([gpu|S],S).
sustantivo([ssd|S],S).
sustantivo([microfono|S],S).
sustantivo([abanicos|S],S).
sustantivo([enfriamiento|S],S).
sustantivo([referencia|S],S).
sustantivo([link|S],S).
sustantivo([bibliografia|S],S).
sustantivo([cita|S],S).
sustantivo([callCenterLog|S],S).


%Negaciones
% arg 0 negación
% arg 1 el resto de la lista
negacion([no|S],S).
negacion([nunca|S],S).
negacion([jamas|S],S).

%Problemas
% arg 0 problema
problemas(no_enciende).
problemas(no_funciona).
problemas(no_prende).
problemas(se_calienta).
problemas(no_tiene_conexion).
problemas(esta_muy_caliente).
problemas(esta_dañado).
problemas(no_responde).
problemas(se_pega).
problemas(se_sobrecalento).
problemas(no_encendio).

%Lista de elementos de hardware a utilizar en la app
hardware([mouse,monitor,teclado,case,ram,procesador,fuente,parlante,
		pantalla,headset,impresora,usb,hdmi,hdd,camara,cargador,
		bateria,gpu,ssd,microfono,abanicos,enfriamiento]).

%Lista de palabras clave
claves([referencia,cita,link,bibliografia,referencias,links,citas]).


%Lista de saluditos
saludos([hola,buenas,buenos,como,saludo]).

%Lista de despedidas
despedidas([muchas,gracias,hasta,luego,adios,bye,ok,listo]).




%Intersección de elementos entre varias listas
overlap_hardware(L1,X):- hardware(L2),member(X,L1),member(X,L2).
overlap_claves(L1,Y):- claves(L2),member(Y,L1),member(Y,L2).
overlap_referencias(L1,X):-overlap_hardware(L1,X),overlap_claves(L1,Y).
overlap_causas(L1,X):-overlap_hardware(L1,X),member(causas,L1).
overlap_saludo(Line1,X):- saludos(L2),member(X,Line1),member(X,L2).
overlap_despedidas(Line1,X):- despedidas(L2),member(X,Line1),member(X,L2).



%---------------- Bloque de causas --------------------
causas(impresora,
"1. Su impresora no está conectada.
2. No tiene los drivers instalados.
3. La impresora no está en la misma red que su computadora.
4. Su impresora no tiene tinta.
5. El cable de su impresora esta dañado
6. Su impresora puede estar sucia, por lo que se debe limpiar.
7. Los cabezales pueden estar desalineados. ").

causas(monitor,
"1.Su monitor no está conectado.
2. Su monitor no está recibiendo alimentación eléctrica.
3. El interruptor de la fuente de poder no está encendido. ").

causas(teclado,
"1. Su teclado está mal conectado.
2.Su teclado no está recibiendo alimentación eléctrica.
3. Su teclado está sucio. ").
causas(parlante,
"1. Su parlante está mal conectado.
2. Su parlante no está recibiendo alimentación eléctrica.
3.Su parlante está sucio. ").
causas(mouse,
"1. El controlador del mouse está obsoleto.
2. El cable del mouse está dañado.
3. La batería del mouse inhalambrico está dañada.
4. El puerto de conexión USB de la computadora está dañado.").
causas(calentamiento,
"1. El procesador se calienta demasiado.
2. La temperatura del disco duro es demasiado elevada.
3. El módulo de memoria RAM se calienta.
4. Hay demasiado polvo. ").

%---------------- Bloque de preguntas --------------------
%impresora
pregunta(imp_con_elec, "¿Revisó que la impresora se encuentre conectada?").
pregunta(prim_vez, "¿Es la primera vez que utiliza la impresora?").
pregunta(drivers, "¿Ya instaló los drivers de su impresora?").
pregunta(wifi, "¿Su impresora es WiFi?").
pregunta(imp_con_inter, "¿Su impresora está conectada a la misma red que su computadora?").
pregunta(tinta, "¿Su impresora tiene suficiente tinta en todos sus cartuchos?").
pregunta(cable, "¿Verificó que el cable de su impresora se encuentre en buenas condiciones?").
pregunta(liquido, "¿Ha derramado algún líquido sobre la impresora?").
pregunta(polvo, "¿Su impresora ha sido limpiada correctamente recientemente?").
pregunta(sonido, "¿Su impresora suena mal cuando se mueve?").
pregunta(enciende, "¿Su impresora enciende?").
pregunta(papel, "¿El papel usado se encuentra en buenas condiciones?").
pregunta(imp_borrosa, "¿Su impresión se ve borrosa?").
pregunta(imp_vieja, "¿Su impresora vieja?").
pregunta(cabezales, "¿La impresión aparece desalineada?").
pregunta(errores, "¿La impresora está encendida pero sigue sin funcionar?").
pregunta(pantalla_mensajes, "¿La impresora posee pantalla?").
pregunta(alarmas_leds, "¿La impresora presenta una alarma o leds que comunmente no están activados?").

%monitor
pregunta(monitorConectado, "Verificó que tenga alimentacion electrica? ").
pregunta(monitorCableConectado, "Revisó que los cables estén conectados correctamente? ").
pregunta(monitorInterruptorFP, "Verificó que el interruptor de la fuente de poder esté encendido? ").

%teclado
pregunta(tecladoConectado,"¿Su teclado está conectado a la computadora?").
pregunta(tecladoConCable,"Su teclado es  con cable? ").
pregunta(tecConCable, "Revisó que el cable esté conectado correctamente? ").
pregunta(tecladoSinCaBle, "¿Revisó que el USB del teclado inhalámbrico esté conectado? ").
pregunta(tecladoLuz, "¿Verificó  que la luz de conexión del teclado encienda? ").
pregunta(tecladoControlador, "¿Actualizó recientemente el controlador del teclado en su computadora? ").
pregunta(tecladoBateria,"¿Ha cambiado la batería del  teclado recientemente?").
pregunta(tecladoSucio,"¿Su teclado se ve con algún tipo de suciedad?").

%parlantes
pregunta(parlanteConCable, "¿Su Parlante tiene cable? ").
pregunta(parlanteConectado, "¿Verificó que tenga alimentacion electrica? ").
pregunta(parlanteJack, "¿Revisó que el cable del jack esté conectado correctamente? ").
pregunta(parlanteSucio, "¿Limpió sus parlantes? ").
pregunta(parlanteBateria,"¿Su parlante está cargado?").
pregunta(parlanteConexion,"¿Se detectó   que el parlante se muestre en la conexión Bluetooth monitor?").

%mouse
pregunta(mouseCable, "¿Su mouse es inhalambrico?").
pregunta(conCable, "¿Su mouse está conectado?").
pregunta(usbInhalambrico,"¿El USB de mouse inhalámbrico está conectado?").
pregunta(bateria, "¿Su mouse tiene batería?").
pregunta(revCable, "¿revisó que su cable  no esté dañado?").
pregunta(controlador, "¿Actualizó el controlador del mouse ?"). 


%---------------- Bloque de respuestas --------------------
%impresora
respuesta(imp_sin_elec, "Proceda a conectar su impresora a un tomacorriente.").
respuesta(no_drivers, "Proceda a instalar los drivers de su impresora").
respuesta(imp_sin_inter, "Proceda a conectar su impresora a la red.").
respuesta(sin_tinta, "Proceda a cambiar él/los cartuchos de tinta necesarios de su impresora.").
respuesta(mal_cable, "Proceda a cambiar el cable de su impresora").
respuesta(componente_malo, "Debe llevar su impresora a ser reparada, posiblemente se dañó un componente").
respuesta(sucia, "Debe limpiar su impresora.").
respuesta(cambio_papel, "Proceda a cambiar el tipo de papel utilizado.").
respuesta(sin_resp, "El sistema no es capaz de atender su duda. Contacte un experto.").
respuesta(desalineado, "Debe reajustar los cabezales en configuraciones de impresora.").
respuesta(mensaje, "Siga las instrucciones que aparecen en la pantalla de su impresora").
respuesta(alarmas, "Lea el manual de usuario sobre esta alarma o luz indicadora").

%monitor
respuesta(monitorSinLuz, "Proceda a revisar la conexión del cable de corriente 
en la fuente de alimentación y en el enchufe de la pared.").
respuesta(monitorConexiones, "Compruebe las conexiones del cable que conecta al monitor a 
la torre del PC (cable VGA, HDMI, DVI...).").
respuesta(monitorEncenderInterruptor, "Proceda a encender el interruptor de la fuente de poder.").
respuesta(monitorPuertoCableMalo, "El cable de su monitor está dañado proceda a cambiarlo.").

%teclado
respuesta(tecladoConecteCable, "Proceda a conectar su teclado al PC.").
respuesta(tecladoConecteUSB, "Proceda a conectar  el puerto del teclado inhalambrico.").
respuesta(tecladoLimpielo, "Limpie su teclado y vuelva a intentar usarlo.").
respuesta(tecladoActualiceControlador, "Actualice el controlador de su teclado.").
respuesta(tecladoBateriaNueva, "Cómprele  una batería nueva a su teclado").
respuesta(tecladoCompreTeclado, "compre un nuevo teclado.").

%parlantes
respuesta(parlanteConecteCorriente, "Proceda a conectar sus parlantes a la corriente.").
respuesta(parlanteConecteJack, "Proceda a conectar suparlante al puerto 3.5  del PC.").
respuesta(parlanteLimpielos, "Limpie sus parlantes y vuelva a intentar usarlos.").
respuesta(parlanteMalo,"Parlante en mal estado, proceda a cambiarlo").
respuesta(parlanteCargueParlante, "Cargue el parlante para que pueda usarlo.").
respuesta(parlanteConecteABLuetooh, "encienda  el bluetooh del parlante ,").

%mouse
respuesta(canecte,"Conecte el cable del mouse.").
respuesta(cableMalo,"Cambie  de mouse debido a que el daño del cable es irreparable.").
respuesta(sinBateria,"Inserte una bateria  nueva al mouse.").
respuesta(actualizaControlador, "Por favor actualice el controlador para  que funcione correctamente.").
respuesta(conecteUSB,"Por favor conecte el USB del mouse inalámbrico.").


%---------------- Bloque de referencias --------------------
referencia(impresora, "La referencia sería:
https://www.pcworld.es/tutoriales/otros-dispositivos/impresora-no-funciona-problemas-impresion-3675127/").
referencia(monitor, "La referencia sería:
https://computerhoy.com/noticias/hardware/mi-ordenador-no-funciona-problemas-mas-comunes-tu-pc-su-solucion-74295").
referencia(teclado, "La referencia sería:
https://www.softonic.com/articulos/5-problemas-frecuentes-con-el-teclado-y-su-solucion").
referencia(parlantes, "La referencia sería:
https://techlandia.com/funcionan-altavoces-computador-como_393766/").
referencia(mouse, "La referencia sería:
https://support.microsoft.com/es-cr/help/4033434/accessories-mouse-common-mouse-setup-issues").
referencia(enfriamiento, "La referencia sería:
https://www.aboutespanol.com/10-soluciones-si-el-pc-se-calienta-3507856").






