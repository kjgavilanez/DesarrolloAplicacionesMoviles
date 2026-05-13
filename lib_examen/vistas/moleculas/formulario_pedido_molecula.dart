import 'package:flutter/material.dart';

import '../atomos/boton_principal_atom.dart';
import '../atomos/campo_texto_atom.dart';
import '../atomos/selector_atom.dart';

class FormularioPedidoMolecula extends StatelessWidget {
  const FormularioPedidoMolecula({
    super.key,
    required this.formKey,
    required this.nombreController,
    required this.cantidadController,
    required this.productoSeleccionado,
    required this.comboSeleccionado,
    required this.onProductoChanged,
    required this.onComboChanged,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nombreController;
  final TextEditingController cantidadController;
  final String? productoSeleccionado;
  final String? comboSeleccionado;
  final ValueChanged<String?> onProductoChanged;
  final ValueChanged<String?> onComboChanged;
  final VoidCallback onSubmit;

  static const List<String> productos = [
    'Hamburguesa',
    'Salchipapa',
    'Hot Dog',
  ];

  static const List<String> combos = [
    'Solo producto',
    'Combo con papas',
    'Combo completo',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CampoTextoAtom(
            controller: nombreController,
            label: 'Nombre del cliente',
            hintText: 'Escriba el nombre del cliente',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese el nombre del cliente';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          SelectorAtom(
            value: productoSeleccionado,
            label: 'Producto',
            items: productos,
            onChanged: onProductoChanged,
          ),
          const SizedBox(height: 16),
          SelectorAtom(
            value: comboSeleccionado,
            label: 'Tipo de combo',
            items: combos,
            onChanged: onComboChanged,
          ),
          const SizedBox(height: 16),
          CampoTextoAtom(
            controller: cantidadController,
            label: 'Cantidad',
            hintText: 'Ingrese la cantidad',
            keyboardType: TextInputType.number,
            validator: (value) {
              final cantidad = int.tryParse((value ?? '').trim());
              if (value == null || value.trim().isEmpty) {
                return 'Ingrese la cantidad';
              }
              if (cantidad == null) {
                return 'La cantidad debe ser numérica';
              }
              if (cantidad <= 0) {
                return 'La cantidad debe ser mayor a cero';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          BotonPrincipalAtom(
            texto: 'Calcular pedido',
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}