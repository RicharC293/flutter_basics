import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi primera app"),
      ),
      // body: Center(child: Text("HOLA MUNDO")),
      // body: const Center(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //     ],
      //   ),
      // ),
      // body: Center(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //       Text("HOLA MUNDO"),
      //     ],
      //   ),
      // ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          // Colors -> acceder a los colores
          // color: Colors.pink,
          // Centra el contenido 
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pink,
            // image: const DecorationImage(
            //   image: NetworkImage(
            //       'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
            //   fit: BoxFit.cover,
            // ),
            border: Border.all(
              width: 8,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(12),
            /// Solo un circulo 
            // shape: BoxShape.circle,
          ),
          child: Text("X"),
        ),
      ),
    );
  }
}
