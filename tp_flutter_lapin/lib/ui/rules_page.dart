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
        child: Center(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Règles du jeu :',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      decoration: TextDecoration.underline,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Vous devez toucher les taupes qui apparaissent à l'écran afin de gagner des points. C'est au bout d'un certain nombre de points que vous terminerez le niveau.", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("De mignions petits lapins sont aussi visibles à l'écran. Ne les touchez pas si vous ne voulez pas perdre des vies.", textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Venez à bout d'un niveau pour débloquer le suivant, jusqu'à tous les réussir !", textAlign: TextAlign.center),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: null,
                    child: const Text("Retour au Menu"))
              ],
            )
        ),
      ),
    );
  }
}
