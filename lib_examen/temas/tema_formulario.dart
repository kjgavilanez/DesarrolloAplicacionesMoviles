import 'package:flutter/material.dart';
import 'esquema_color.dart';

class TemaFormulario{
  static final campoTexto = InputDecorationTheme(
    filled: true,
    fillColor: ColoresApp.textoClaro,
    labelStyle: const TextStyle(color: Colors.black54),
    prefixIconColor: ColoresApp.primario,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: ColoresApp.neutral),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: ColoresApp.primario, width: 2),
    ),
  );
}