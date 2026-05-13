import 'package:flutter/material.dart';
import 'esquema_color.dart';

class FondosApp{
  static const BoxDecoration degradado = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        ColoresApp.colorSalsa,
        ColoresApp.primario,
        ColoresApp.secundario,
        ColoresApp.colorQueso,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )
  );

  static const BoxDecoration fondoBlanco = BoxDecoration(
    color: ColoresApp.textoClaro,
  );
  static const BoxDecoration fondoGris = BoxDecoration(
    color: ColoresApp.fondoClaro,
  );

  static const BoxDecoration fondoCrema = BoxDecoration(
    color: ColoresApp.colorPan,
  );
}