import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaBotones{
  static final botonPrincipal = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColoresApp.secundario,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static final botonSecundario = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: ColoresApp.primario,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}