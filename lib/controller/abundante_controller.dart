import '../model/abundante_model.dart';

class AbundanteController {
  // Verifica la entrada y retorna un mensaje
  String verificar(String ingreso){
    // Validación: no vacío
    if(ingreso.trim().isEmpty){
      return "El número no puede estar vacío";
    }

    // Validación: debe ser entero
    final numero = int.tryParse(ingreso);
    if(numero == null){
      return "El número debe ser un entero";
    }

    // Validación: positivo
    if(numero <= 0){
      return "Ingrese un número entero positivo";
    }

    // Cálculo usando el modelo
    final esAbundante = AbundanteModel.esAbundante(numero);

    return esAbundante
      ? 'El número $numero es abundante (suma divisores = ${AbundanteModel.sumaDivisoresPropios(numero)})'
      : 'El número $numero no es abundante (suma divisores = ${AbundanteModel.sumaDivisoresPropios(numero)})';
  }
}