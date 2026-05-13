import 'package:flutter/material.dart';

import '../../modelos/comida_modelo.dart';
import '../atomos/etiqueta_atom.dart';

class ResumenNotaVentaMolecula extends StatelessWidget {
  const ResumenNotaVentaMolecula({super.key, required this.pedido});

  final PedidoComidaModelo pedido;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: theme.colorScheme.primary.withValues(alpha: 0.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EtiquetaAtom(
              texto: 'Resumen de nota de venta',
              alignment: Alignment.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 18),
            _lineaDato('Cliente', pedido.nombreCliente),
            _lineaDato('Producto', pedido.producto),
            _lineaDato('Combo', pedido.tipoCombo),
            _lineaDato('Cantidad', pedido.cantidad.toString()),
            const Divider(height: 28),
            _lineaDato('Precio base unitario', _formatear(pedido.precioBaseUnitario)),
            _lineaDato('Valor adicional combo', _formatear(pedido.valorAdicionalComboUnitario)),
            _lineaDato('Subtotal', _formatear(pedido.subtotal)),
            _lineaDato('IVA 15%', _formatear(pedido.iva)),
            const Divider(height: 28),
            _lineaDato('Total a pagar', _formatear(pedido.total), destacado: true),
          ],
        ),
      ),
    );
  }

  Widget _lineaDato(String etiqueta, String valor, {bool destacado = false}) {
    final style = destacado
        ? const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)
        : const TextStyle(fontSize: 15);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(etiqueta, style: style)),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.right,
              style: style,
            ),
          ),
        ],
      ),
    );
  }

  String _formatear(double valor) {
    return '\$${valor.toStringAsFixed(2)}';
  }
}