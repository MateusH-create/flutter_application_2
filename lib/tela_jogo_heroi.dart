import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget{
  const TelaJogoHeroi({super.key});
  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();}

  class TelaJogoHeroiState extends State<TelaJogoHeroi> {
    class _TelaJogoHeroiState extends State<TelaJogoHeroi> {
      String heroiSekecuibadi = 'Nenhum';
      int vida = 0;
      int moedas = 0;
      int poder = 0;
      String urlImagem = '';
    }
    @override
     Widget build(BuildContext context) {
     return Scaffold(
    body: Center(child: Text("Tela do Heroi"))
   );
  }
}