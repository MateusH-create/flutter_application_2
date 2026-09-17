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
  double posicaoHorizontal = 200;
  double passo = 30;

  void moverDireita() {
    setState(() {
      posicaoHorizontal += passo;
    });
  }

  void moverEsquerda() {
    setState(() {
      posicaoHorizontal -= passo;
    });
  }

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
            left: posicaoHorizontal,
            bottom: 120,
            child: Image.network(widget.urlImagem),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            child: FloatingActionButton(
              heroTag: 'btnEsquerda',
              onPressed: moverEsquerda,
              child: Icon(Icons.arrow_back),
            ),
          ),

          Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'btnDireita',
              onPressed: moverDireita,
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
