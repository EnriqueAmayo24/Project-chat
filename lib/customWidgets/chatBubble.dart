import 'package:flutter/material.dart';

// Clase ChatBubble que crea un widget de burbuja de chat.
class ChatBubble extends StatelessWidget {
  // Texto de la burbuja.
  final String text;
  // Indica si el mensaje fue enviado por el usuario actual.
  final bool writtenByMe;

  // Constructor para inicializar el texto y el estado del remitente.
  ChatBubble({required this.text, required this.writtenByMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      // Alinea el contenido a la derecha si es enviado por el usuario, de lo contrario a la izquierda.
      mainAxisAlignment: writtenByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        // Añade un espacio antes de la burbuja si no es enviada por el usuario.
        if (!writtenByMe)
          SizedBox(width: 8),
        Container(
          // Añade padding y margen a la burbuja.
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 5.0),
          // Estilo de la burbuja.
          decoration: BoxDecoration(
            // Color de fondo dependiendo del remitente.
            color: writtenByMe ? Color.fromARGB(255, 22, 189, 91) : Color.fromARGB(255, 199, 190, 216),
            // Bordes redondeados de la burbuja.
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              // El borde inferior izquierdo solo es redondeado si no es enviado por el usuario.
              bottomLeft: writtenByMe ? Radius.circular(15.0) : Radius.zero,
              // El borde inferior derecho solo es redondeado si es enviado por el usuario.
              bottomRight: writtenByMe ? Radius.zero : Radius.circular(15.0),
            ),
          ),
          // Texto dentro de la burbuja.
          child: Text(
            text,
            // Estilo del texto dependiendo del remitente.
            style: TextStyle(
              color: writtenByMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
