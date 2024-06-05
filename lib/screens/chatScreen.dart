import 'package:flutter/material.dart';
import '../customWidgets/chatBubble.dart';

// Clase que define la pantalla de chat.
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

// Estado asociado a ChatScreen.
class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Lista expandible que muestra los mensajes.
        Expanded(
          child: ListView.builder(
            itemCount: 110, // Número de mensajes.
            itemBuilder: (context, index) {
              return Column(
                // Alinea el contenido dependiendo de quién envió el mensaje.
                crossAxisAlignment: "Hola, Como tan muchcho".isNotEmpty
                    ? (index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start)
                    : CrossAxisAlignment.center,
                children: [
                  // Widget de burbuja de chat.
                  ChatBubble(
                    text: "Hola, Como tan muchcho",
                    writtenByMe: index % 2 == 0,
                  ),
                  // Añadimos el GIF después de cada burbuja de texto.
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      // Contenedor con borde para el GIF.
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Color del borde.
                          width: 3.0, // Grosor del borde.
                        ),
                        borderRadius: BorderRadius.circular(15), // Bordes redondeados.
                      ),
                      child: ClipRRect(
                        // Recorta el GIF con bordes redondeados.
                        borderRadius: BorderRadius.circular(12), // Mismo radio que el borde del contenedor.
                        child: Image.network(
                          "https://media.giphy.com/media/26gsjCZpPolPr3sBy/giphy.gif", // URL del GIF.
                          height: 150,  // Ajusta el tamaño del GIF según tus necesidades.
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Campo de texto para ingresar mensajes nuevos.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Escribe tu mensaje", // Texto de ayuda.
              suffixIcon: Icon(Icons.send), // Icono de enviar.
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados.
              ),
            ),
          ),
        ),
      ],
    );
  }
}
