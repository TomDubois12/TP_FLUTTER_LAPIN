import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:go_router/go_router.dart';

class Niveau2Screen extends StatefulWidget {
  const Niveau2Screen({Key? key}) : super(key: key);

  @override
  _Niveau2ScreenState createState() => _Niveau2ScreenState();
}

class _Niveau2ScreenState extends State<Niveau2Screen> {
  int _indexLapin = Random().nextInt(4);
  int _taupe = 0;
  int _lapin = 0;
  Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    _stopwatch.start();
  }

  void gererTape(int index) {
    if (_indexLapin == index) {
      _lapin++;
      if (_lapin == 15) {
        _stopwatch.stop();
        _showCongratulationsDialog();
      } else {
        _indexLapin = Random().nextInt(4);
      }
    } else {
      _taupe++;
      if (_taupe == 10) {
        _showFailsDialog();
      }
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
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous avez touché 15 lapins en ${_stopwatch.elapsed
                    .inSeconds} secondes.'),
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

  Future<void> _showFailsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dommage !'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vous avez touché 10 taupes.'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Recommencer le niveau'),
              onPressed: () {
                setState(() {
                  _lapin = 0;
                  _taupe = 0;
                  _indexLapin = Random().nextInt(4);
                  _stopwatch.reset();
                  _stopwatch.start();
                });
                Navigator.of(context).pop();
              },
            ),
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
        _indexLapin == 0 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b1 = MaterialButton(
      onPressed: () {
        gererTape(1);
      },
      child: Image.asset(
        _indexLapin == 1 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b2 = MaterialButton(
      onPressed: () {
        gererTape(2);
      },
      child: Image.asset(
        _indexLapin == 2 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    var b3 = MaterialButton(
      onPressed: () {
        gererTape(3);
      },
      child: Image.asset(
        _indexLapin == 3 ? 'assets/lapin.png' : 'assets/taupe.png',
        width: 100,
        height: 100,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le jeu du lapin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Niveau 2',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Lapin(s): $_lapin",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  "Taupe(s): $_taupe",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                )
              ],
            ),
            const Text(
              'Touche le plus rapidement 15 lapins',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
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
