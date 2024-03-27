import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Règles du jeu'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: const Center(
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Règles du jeu :',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Les règles du jeu sont simple !", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Vous devez toucher les lapins qui apparaissent à l'écran de plus vite possible afin de gagner des points. C'est au bout de 15 lapins touchés, vous terminerez le niveau.", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("De mignionnes petites taupes sont aussi visibles à l'écran. Ne les touchez pas si vous ne voulez pas faire baisser votre score final.", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Il y a différents niveaux disponibles ! Parcours les, et bat des records de vitesse !", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("BCD GAMES PRODUCTION", textAlign: TextAlign.center),
                ),
              ],
            )
        ),
      ),
    );
  }
}
