import 'package:flutter/material.dart';
import '../../modelos/comida_modelo.dart';

import '../moleculas/resumen_nota_venta_molecula.dart';

class VistaNotaVentaComida extends StatelessWidget {
  const VistaNotaVentaComida({super.key, required this.pedido});

  final Object? pedido;

  @override
  Widget build(BuildContext context) {
    final pedidoRecibido = pedido as PedidoComidaModelo?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota de venta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: pedidoRecibido == null
            ? const Center(
                child: Text('No se encontró información del pedido.'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Detalle del pedido',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ResumenNotaVentaMolecula(pedido: pedidoRecibido),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}