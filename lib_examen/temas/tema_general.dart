import 'package:flutter/material.dart';
import 'esquema_color.dart';
import 'tema_appbar.dart';
import 'tema_botones.dart';
import 'tema_formulario.dart';
import 'tema_fondos.dart';
import 'tipografia.dart';

class TemaGeneral{
  static final ThemeData claro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColoresApp.primario,
      secondary: ColoresApp.secundario,
      tertiary: ColoresApp.acento,
      background: FondosApp.fondoGris.color ?? ColoresApp.fondoClaro,
      onPrimary: ColoresApp.textoClaro,
      onSecondary: Colors.black,
      onSurface: ColoresApp.textoOscuro,
    ), 
    textTheme: TipografiaApp.texto,
    appBarTheme: TemaAppBar.estilo,
    elevatedButtonTheme: TemaBotones.botonPrincipal,
    outlinedButtonTheme: TemaBotones.botonSecundario,
    inputDecorationTheme: TemaFormulario.campoTexto,
    scaffoldBackgroundColor: FondosApp.fondoGris.color ?? ColoresApp.fondoClaro,
    canvasColor: FondosApp.fondoBlanco.color ?? ColoresApp.textoClaro,

  );
}


