import 'package:flutter/material.dart';

import 'tela_jogo_heroi.dart';

class TelaAmbiente extends StatefulWidget {
  const TelaAmbiente({super.key});
  @override
  State<TelaAmbiente> createState() => TelaAmbienteState();}

class TelaAmbienteState extends State<TelaAmbiente> {
  @override
     Widget build(BuildContext context) {
     return Scaffold(body: Stack(
      fit: StackFit.expand,
      children: [
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaww8Ys38PRlfTgUjqLHNIVKITta5M-49j8LV_rxfddA&s=10',fit: BoxFit.cover),
        Center(
          SizedBox(
            width: 200,
            height: 120,
          ),
          child: Text("Seu Heroi"),
        ),
        Card(
          color: Colors.grey,
          child: Padding(padding: EdgeInsets.all(20.0)),
        )
        ],
        )
     );
  }
}