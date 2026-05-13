import '../modelos/comida_modelo.dart';

class ComidaControlador {
  static const Map<String, double> _preciosBase = {
    'Hamburguesa': 4.50,
    'Salchipapa': 3.75,
    'Hot Dog': 3.25,
  };

  static const Map<String, double> _preciosCombo = {
    'Solo producto': 0.00,
    'Combo con papas': 1.50,
    'Combo completo': 2.75,
  };

  String? validarCampos({
    required String nombreCliente,
    required String producto,
    required String tipoCombo,
    required String cantidadTexto,
  }) {
    if (nombreCliente.trim().isEmpty ||
        producto.trim().isEmpty ||
        tipoCombo.trim().isEmpty ||
        cantidadTexto.trim().isEmpty) {
      return 'Complete todos los campos.';
    }

    final cantidad = int.tryParse(cantidadTexto.trim());
    if (cantidad == null) {
      return 'La cantidad debe ser un número válido.';
    }

    if (cantidad <= 0) {
      return 'La cantidad debe ser mayor a cero.';
    }

    if (!_preciosBase.containsKey(producto)) {
      return 'Producto no válido.';
    }

    if (!_preciosCombo.containsKey(tipoCombo)) {
      return 'Tipo de combo no válido.';
    }

    return null;
  }

  PedidoComidaModelo crearPedido({
    required String nombreCliente,
    required String producto,
    required String tipoCombo,
    required String cantidadTexto,
  }) {
    final cantidad = int.parse(cantidadTexto.trim());
    final precioBase = _preciosBase[producto] ?? 0;
    final valorCombo = _preciosCombo[tipoCombo] ?? 0;
    final subtotal = (precioBase + valorCombo) * cantidad;
    final iva = subtotal * 0.15;
    final total = subtotal + iva;

    return PedidoComidaModelo(
      nombreCliente: nombreCliente.trim(),
      producto: producto,
      tipoCombo: tipoCombo,
      cantidad: cantidad,
      subtotal: subtotal,
      iva: iva,
      total: total,
      precioBaseUnitario: precioBase,
      valorAdicionalComboUnitario: valorCombo,
    );
  }
}