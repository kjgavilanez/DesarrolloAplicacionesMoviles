import 'package:flutter/material.dart';

import '../../controladores/comida_controlador.dart';
import '../moleculas/formulario_pedido_molecula.dart';

class VistaComidaRapida extends StatefulWidget {
  const VistaComidaRapida({super.key});

  @override
  State<VistaComidaRapida> createState() => _VistaComidaRapidaState();
}

class _VistaComidaRapidaState extends State<VistaComidaRapida> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _controlador = ComidaControlador();

  String? _productoSeleccionado;
  String? _comboSeleccionado;

  @override
  void dispose() {
    _nombreController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  void _calcularPedido() {
    final esValido = _formKey.currentState?.validate() ?? false;
    if (!esValido) {
      return;
    }

    final producto = _productoSeleccionado ?? '';
    final combo = _comboSeleccionado ?? '';
    final mensajeError = _controlador.validarCampos(
      nombreCliente: _nombreController.text,
      producto: producto,
      tipoCombo: combo,
      cantidadTexto: _cantidadController.text,
    );

    if (mensajeError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensajeError)),
      );
      return;
    }

    final pedido = _controlador.crearPedido(
      nombreCliente: _nombreController.text,
      producto: producto,
      tipoCombo: combo,
      cantidadTexto: _cantidadController.text,
    );

    Navigator.pushNamed(
      context,
      '/notaVentaComida',
      arguments: pedido,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido de comida rápida'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingrese los datos del pedido',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Complete el formulario para calcular el valor total y generar la nota de venta.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            FormularioPedidoMolecula(
              formKey: _formKey,
              nombreController: _nombreController,
              cantidadController: _cantidadController,
              productoSeleccionado: _productoSeleccionado,
              comboSeleccionado: _comboSeleccionado,
              onProductoChanged: (value) => setState(() => _productoSeleccionado = value),
              onComboChanged: (value) => setState(() => _comboSeleccionado = value),
              onSubmit: _calcularPedido,
            ),
          ],
        ),
      ),
    );
  }
}