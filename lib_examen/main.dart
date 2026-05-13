import 'package:flutter/material.dart';

import 'temas/index.dart';
import 'vistas/paginas/vista_comida_rapida.dart';
import 'vistas/paginas/vista_nota_venta_comida.dart';

void main() {
  runApp(const PryComidaRapidaApp());
}

class PryComidaRapidaApp extends StatelessWidget {
  const PryComidaRapidaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comida Rápida',
      theme: TemaGeneral.claro,
      initialRoute: '/comida',
      routes: {
        '/comida': (context) => const VistaComidaRapida(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/notaVentaComida') {
          return MaterialPageRoute(
            builder: (context) => VistaNotaVentaComida(
              pedido: settings.arguments,
            ),
            settings: settings,
          );
        }

        return null;
      },
    );
  }
}
