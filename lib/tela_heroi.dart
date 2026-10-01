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
  double jump = 100;
  bool pocaoColetada = false;
  double posVerticalPocao = 150;
  double posHorizontalPocao = 200;

  final double chao = 120;
  late double posicaoVertical = chao;
  bool pulando = false;

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

  void pular() async {
    if (pulando) return;
    setState(() {
      pulando = true;
      posicaoVertical = chao + jump;
    });


    await Future.delayed(Duration(milliseconds: miliss));
    if (!mounted) return;
    setState(() => posicaoVertical = chao);
    checarColisao();
    await Future.delayed(Duration(milliseconds: miliss));
    if (!mounted) return;
    setState(() => pulando = false);
  }

  void checarColisao() {
    if (pocaoColetada) return;

    bool bateX = (posicaoHorizontal - posHorizontalPocao).abs() < 60;
    bool bateY = (posicaoVertical - posVerticalPocao).abs() < 60;
    
    if (bateX && bateY) {
      setState(() {
        pocaoColetada = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaww8Ys38PRlfTgUjqLHNIVKITta5M-49j8LV_rxfddA&s=10',
              fit: BoxFit.cover,
            ),
          ),

          AnimatedPositioned(
            duration: Duration(milliseconds: miliss),
            curve: Curves.bounceIn,
            left: posicaoHorizontal,
            bottom: posicaoVertical,
            child: SizedBox(
              height: 400,
              child: Image.network(widget.urlImagem),
            ),
          ),
          
          Positioned(
            top: 40,
            left: 16,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.nomeHeroi,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text('vida: ${widget.vida}',style: const TextStyle(color: Colors.white)),
                    Text('poder: ${widget.poder}',style: const TextStyle(color: Colors.white)),
                    Text('moedas: ${widget.moedas}',style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
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
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                heroTag: "btnPular",
                onPressed: pular,
                child: Icon(Icons.arrow_upward),
              ),
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

          Visibility(visible: !pocaoColetada,
          child: Positioned(
            left: posHorizontalPocao,
            bottom: posVerticalPocao,
            child: Image.network("https://i0.statig.com.br/bancodeimagens/1u/8s/xp/1u8sxpjgfis267apsjfj76urv.jpg", height: 100,)
            ),
          )
        ],
      ),
    );
  }
}