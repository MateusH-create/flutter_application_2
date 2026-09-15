import 'package:flutter/material.dart';

import 'tela_jogo_heroi.dart';

class TelaAmbiente extends StatefulWidget {
  final String nomeHeroi;
  final String urlImagem;
  final int moedas;
  final int vida;
  final int poder;

  const TelaAmbiente({
    super.key,
    required this.nomeHeroi,
    required this.urlImagem,
    required this.moedas,
    required this.vida,
    required this.poder,
  });

  @override
  State<TelaAmbiente> createState() => TelaAmbienteState();
}

class TelaAmbienteState extends State<TelaAmbiente> {
  int miliss = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaww8Ys38PRlfTgUjqLHNIVKITta5M-49j8LV_rxfddA&s=10',
            fit: BoxFit.cover,
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: miliss),
            curve: Curves.bounceIn,
            left: 200,
            bottom: 120,
            height: 130,
            child: Image.network(widget.urlImagem),
          ),
        ],
      ),
    );
  }
}
