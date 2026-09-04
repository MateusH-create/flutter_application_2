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

              Image.network(urlImagem),

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
       urlImagem = 'https://scontent.fbfh2-1.fna.fbcdn.net/v/t39.30808-6/480499567_4096431727267575_7015564186884631824_n.jpg?stp=dst-jpg_tt6&cstp=mx640x663&ctp=p180x540&_nc_cat=101&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=pRHKyIHEU_sQ7kNvwEV37o0&_nc_oc=AdrsNq6WAhvzVY62itfLN789UMaTOlXGGtWhY5x6S0YiC8qW7wjok_-IDwx12MH7KJA&_nc_zt=23&_nc_ht=scontent.fbfh2-1.fna&_nc_gid=w7Kz4YElmSfufE29aMLoGw&_nc_ss=7b289&oh=00_AQL6Y_Bw_AAf2NV5md6nLocaasYRSFiywujce8scqg9NTQ&oe=6AA0B17C';
       }
       else if(tipoHeroi == "Mago Dos Games") {
       nomeHeroi = "Davy Jones";
       vida = 100;
       moedas = 1000;
       poder = 67;
       urlImagem = 'data:image/jpeg;base64,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';
       }
       else if(tipoHeroi == "Cientista") {
       nomeHeroi = "Alfred Jeffrey kirk Junior De machado Einstein";
       vida = 20;
       moedas = 100;
       poder = 120;
       urlImagem = 'https://images3.memedroid.com/images/UPLOADED97/65cbf2125c201.webp';
       }
     });
   }
}