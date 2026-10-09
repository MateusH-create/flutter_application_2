import 'package:flutter/material.dart';

import 'tela_heroi.dart';

class TelaJogoHeroi extends StatefulWidget {
  const TelaJogoHeroi({super.key});
  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();
}

class TelaJogoHeroiState extends State<TelaJogoHeroi> {
  String nomeHeroi = '';
  int vida = 0;
  int moedas = 0;
  int poder = 0;
  String urlImagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("Escolha seu Heroi"),
              const SizedBox(height: 10),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => escolherheroi("Wretch"),
                    child: const Text("Wretch"),
                  ),
                  ElevatedButton(
                    onPressed: () => escolherheroi("Mago Dos Games"),
                    child: const Text("Mago Dos Games"),
                  ),
                  ElevatedButton(
                    onPressed: () => escolherheroi("Cientista"),
                    child: const Text("Cientista"),
                  ),
                ],
              ),

              Card(
                elevation: 5,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Nome: $nomeHeroi',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(),
                      Text(
                        '❤️ Vida: $vida',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        '💰 Moedas: $moedas',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        '⚔️ Poder: $poder',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),

                      SizedBox(
                        width: 300,
                        height: 300,
                        child: urlImagem.isEmpty
                            ? const SizedBox()
                            : urlImagem.startsWith('http')
                                ? Image.network(
                                    urlImagem,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stack) =>
                                        const Center(
                                      child: Text('Erro ao carregar imagem'),
                                    ),
                                  )
                                : Image.asset(
                                    urlImagem,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stack) =>
                                        const Center(
                                      child: Text('Imagem local não encontrada'),
                                    ),
                                  ),
                      ),

                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: nomeHeroi.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaAmbiente(
                                      nomeHeroi: nomeHeroi,
                                      urlImagem: urlImagem,
                                      moedas: moedas,
                                      poder: poder,
                                      vida: vida,
                                    ),
                                  ),
                                );
                              },
                        child: const Text('Escolher'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void escolherheroi(String tipoHeroi) {
    setState(() {
      if (tipoHeroi == "Wretch") {
        nomeHeroi = "Wretch";
        vida = 67;
        moedas = 0;
        poder = 10;
        urlImagem = 'imagem/Desleichado.png';
      } else if (tipoHeroi == "Mago Dos Games") {
        nomeHeroi = "Davy Jones";
        vida = 100;
        moedas = 1000;
        poder = 67;
        urlImagem = 'imagem/Davy.png';
      } else if (tipoHeroi == "Cientista") {
        nomeHeroi = "Alfred Jeffrey kirk Junior De machado Einstein";
        vida = 20;
        moedas = 100;
        poder = 120;
        urlImagem = 'imagem/Albert.png';
      }
    });
  }
}