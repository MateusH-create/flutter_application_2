import 'package:flutter/material.dart';

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
  late int _vida;

  final double chao = 50;
  late double posicaoVertical = chao;

  bool pulando = false;
  bool pocaoColetada = false;

  final double alturaHeroi = 150;
  double get posHorizontalPocao => MediaQuery.of(context).size.width * 0.55;
  double get posVerticalPocao => chao + jump;
  double inimigoX = -40.0;
  double inimigoY = 500.0;
  double posicaoHorizontal = 200;
  double passo = 30;
  double jump = 100;

  @override
  void initState() {
    super.initState();
    _vida = widget.vida;
  }

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

 
    checarColisao();

    // Desce
    setState(() => posicaoVertical = chao);
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
        _vida += 50;
      });
    }
  }

  Widget _imagemHeroi() {
    if (widget.urlImagem.isEmpty) return const SizedBox();

    if (widget.urlImagem.startsWith('http')) {
      return Image.network(
        widget.urlImagem,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stack) =>
            const Icon(Icons.error, color: Colors.red, size: 50),
      );
    }

    return Image.asset(
      widget.urlImagem,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stack) =>
          const Icon(Icons.error, color: Colors.red, size: 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Positioned.fill(
            child: Image.asset(
              'imagem/Juazeiro.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Erro no fundo: $error',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          if (!pocaoColetada)
            Positioned(
              left: posHorizontalPocao,
              bottom: posVerticalPocao,
              child: Image.asset(
                'imagem/Cura.png',
                height: 80,
                errorBuilder: (context, error, stack) =>
                    const Icon(Icons.local_drink, color: Colors.red, size: 60),
              ),
            ),

          AnimatedPositioned(
            duration: Duration(milliseconds: miliss),
            curve: Curves.bounceIn,
            left: posicaoHorizontal,
            bottom: posicaoVertical,
            child: SizedBox(
              height: alturaHeroi,
              child: _imagemHeroi(),
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'vida: $_vida',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'poder: ${widget.poder}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    'moedas: ${widget.moedas}',
                    style: const TextStyle(color: Colors.white),
                  ),
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
              child: const Icon(Icons.arrow_back),
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
                child: const Icon(Icons.arrow_upward),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'btnDireita',
              onPressed: moverDireita,
              child: const Icon(Icons.arrow_forward),
            ),
          ),
          Positioned(
            bottom: inimigoX,
            right: inimigoY,
            child: Image.asset('imagem/Lula.png', width: 600, height: 600),
          )
        ],
      ),
    );
  }
}