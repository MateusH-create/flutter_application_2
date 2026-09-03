
import 'package:flutter/material.dart';

import 'tela_jogo_heroi.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('imagem/minha_imagem.png.jpg'),
            Image.asset('imagem/Basura.png', width: 345,),
            ],),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TelaJogoHeroi()
                )
                );
            }, child: Text('Entrar')),
          ],
      ),
    ),
);

  }
}