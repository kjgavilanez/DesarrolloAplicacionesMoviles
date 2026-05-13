import 'package:flutter/material.dart';

class BotonPrincipalAtom extends StatelessWidget {
  const BotonPrincipalAtom({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  final String texto;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(texto),
      ),
    );
  }
}