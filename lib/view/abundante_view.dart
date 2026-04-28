import 'package:flutter/material.dart';
import '../controller/abundante_controller.dart';

//atomo
class LabelText extends StatelessWidget{
  final String texto;

  LabelText(this.texto, {super.key});

  @override
  Widget build(BuildContext context){
    return Text(
      texto,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );

  }
}

//
class NumberField extends StatelessWidget{
  final TextEditingController controller;

  NumberField({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Ingrese un número entero positivo',
      ),
    );
  }
}

//boton
class Button extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  Button({super.key, required this.text, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text),
    );
  }
}

//etiqueta resultados
class ResultadoEtiqueta extends StatelessWidget{
  final String texto; 

  ResultadoEtiqueta({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

//molecula

class NumeroInput extends StatelessWidget{
  final TextEditingController controller;

  const NumeroInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LabelText('Verificar Número Abundante'),
        SizedBox(height: 20),
        NumberField(controller: controller),
      ],
    );
  }
}

//organismo --- aqui se llama a la funcion del controller para hacer las validaciones y mostrar el resultado
class AbundanteCard extends StatefulWidget{
  const AbundanteCard({super.key});

  @override
  State<AbundanteCard> createState() => _AbundanteCardState();
}

class _AbundanteCardState extends State<AbundanteCard>{
  final TextEditingController controllerNumero = TextEditingController();

  final AbundanteController abundanteController = AbundanteController();

  String resultado = '';

  void verificarNumero(){
    setState(() {
      resultado = abundanteController.verificar(controllerNumero.text);
    });
  }

  @override
  Widget build(BuildContext context) {
   return Card(
    margin: EdgeInsets.all(20),
    child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          NumeroInput(controller: controllerNumero),
          SizedBox(height: 20),
          Button(text: 'Verificar', onPressed: verificarNumero),
          SizedBox(height: 20),
          ResultadoEtiqueta(texto: resultado),
        ],
      ),
    ),
   );
  }
}

//pagina

class AbundantePagina extends StatelessWidget{
  const AbundantePagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Número Abundante'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: AbundanteCard(),
      ),
    );
  }
}