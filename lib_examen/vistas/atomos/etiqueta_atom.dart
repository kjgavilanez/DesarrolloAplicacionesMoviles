import 'package:flutter/material.dart';

class EtiquetaAtom extends StatelessWidget {
  const EtiquetaAtom({
    super.key,
    required this.texto,
    this.style,
    this.alignment = Alignment.centerLeft,
  });

  final String texto;
  final TextStyle? style;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(texto, style: style),
    );
  }
}