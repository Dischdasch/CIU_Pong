# CIU_Pong
Autor:
 Escrito por Dascha Blehm
 
Resultado:
 Un juego de Pong para dos jugadores. El control funciona a través del teclado con las teclas w y s y flecha arriba y flecha abajo.
 
Desiciones:
 Creamos clases para mayor claridad y porque necesitamos múltiples objetos de los jugadores.
 Almacenamos en variables booleanas qué teclas se presionan. Esto permite que varias teclas se procesen al presionarlas al mismo tiempo.
 La dirección inicial de la bola se establece a partir de un movimiento aleatorio en la dirección x e y (entre -5 y 5). Esto varía el ángulo de la pelota y la velocidad, y el juego sigue siendo emocionante.
 
 Extras:
 El bate del jugador líder es de color verde. La paleta del otro es de color rojo.
 Cuando un jugador ha alcanzado los 3 puntos, hay una pantalla final que muestra el ganador y la puntuación.
