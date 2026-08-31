
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaInicial());
    
  } 
}
class TelaInicial extends StatelessWidget {
   const TelaInicial ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Caverna do Dragão',
            ),
            Image.asset('imagem/minha_imagem.png.jpg'),
            ElevatedButton(onPressed: () {}, child: Text('EngineLayer')),
          ],
      ),
    ),
);

  }
}