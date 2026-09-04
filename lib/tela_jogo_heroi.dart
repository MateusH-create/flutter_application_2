import 'package:flutter/material.dart';

class TelaJogoHeroi extends StatefulWidget{
  const TelaJogoHeroi({super.key});
  @override
  State<TelaJogoHeroi> createState() => TelaJogoHeroiState();}

  
class TelaJogoHeroiState extends State<TelaJogoHeroi> {
      String nomeHeroi = '';
      int vida = 0;
      int moedas = 0;
      int poder = 0;
      String urlImagem = '';
    
    @override
     Widget build(BuildContext context) {
     return Scaffold(body: Center(
      child:Column(
        children: [
          Text("Escolha seu Heroi"),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => escolherheroi("Wretch"), child: Text("Wretch")),
              ElevatedButton(onPressed: () => escolherheroi("Mago Dos Games"), child: Text("Mago Dos Games")),
              ElevatedButton(onPressed: () => escolherheroi("Cientista"), child: Text("Cientista")),

              Card(
                elevation: 5, // Dá uma sombra 3D ao cartão
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Nome: $nomeHeroi', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Divider(), // Linha divisória
                      Text('❤️ Vida: $vida', style: const TextStyle(fontSize: 18, color: Colors.red)),
                      Text('💰 Moedas: $moedas', style: const TextStyle(fontSize: 18, color: Colors.orange)),
                      Text('⚔️ Poder: $poder', style: const TextStyle(fontSize: 18, color: Colors.blue)),
                    ],
                  ),
                ),
              )
            ],
            

          )
        
        ],

        )
      )
     );
  }
  void escolherheroi(String tipoHeroi) {
    setState(() {
      if(tipoHeroi == "Wretch") {
       nomeHeroi = "Wretch";
       vida = 67;
       moedas = 0;
       poder = 10;
       urlImagem = "https://www.facebook.com/groups/175495137765782/posts/350116973636930/";
       }
       else if(tipoHeroi == "Mago Dos Games") {
       nomeHeroi = "Davy Jones";
       vida = 100;
       moedas = 1000;
       poder = 67;
       urlImagem = "https://x.com/DavyJonesRJ/status/1720209311207391306";
       }
       else if(tipoHeroi == "Cientista") {
       nomeHeroi = "Alfred Jeffrey kirk Junior De machado Einstein";
       vida = 20;
       moedas = 100;
       poder = 120;
       urlImagem = "https://i.pinimg.com/1200x/23/59/bd/2359bdc75237564c903c1c136817a779.jpg";
       }
     });
   }
}