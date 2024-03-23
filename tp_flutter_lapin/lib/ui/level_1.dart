import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

class Niveau1Screen extends StatefulWidget {
  const Niveau1Screen({Key? key}) : super(key: key);

  @override
  _Niveau1ScreenState createState() => _Niveau1ScreenState();
}

class _Niveau1ScreenState extends State<Niveau1Screen> {
  int _indexLapin = Random().nextInt(4);
  int _flops = 0;
  int _pafs = 0;

  void gererTape(int index) {
    if (_indexLapin == index) {
      _pafs++;
      if (_pafs == 15) {
        _showCongratulationsDialog();
      } else {
        _indexLapin = Random().nextInt(4);
      }
    } else {
      _flops++;
    }
    setState(() {});
  }

  Future<void> _showCongratulationsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Bravo!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous avez touché 50 lapins.'),
                Text('Retournez au menu pour consulter vos scores')
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Retournez au menu'),
              onPressed: () => context.go('/home'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var b0 = MaterialButton(
      onPressed: () {
        gererTape(0);
      },
      child: Image.asset(
        _indexLapin == 0 ? 'lapin.png' : 'taupe.png',
        width: 200,
        height: 200,
      ),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Image.asset(
        _indexLapin == 1 ? 'lapin.png' : 'taupe.png',
        width: 200,
        height: 200,
      ),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Image.asset(
        _indexLapin == 2 ? 'lapin.png' : 'taupe.png',
        width: 200,
        height: 200,
      ),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Image.asset(
        _indexLapin == 3 ? 'lapin.png' : 'taupe.png',
        width: 200,
        height: 200,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tape le lapin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Pafs: $_pafs',
                  style: const TextStyle(color: Colors.green, fontSize: 20),
                ),
                Text(
                  "Flops: $_flops",
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
            const Text(
              'Niveau 1 (Facile)',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const Text(
              'Touche le plus rapidement 50 lapins',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b0,
                b1,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b2,
                b3,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
