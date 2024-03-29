import 'package:flutter/material.dart';
import 'package:tp_flutter_lapin/model/score.dart';
import '../database/score_db.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoreScreen> {
  late Future<List<Score>> futureScore;
  final scoreDB = ScoreDB();

  @override
  void initState() {
    super.initState();
    fetchScore();
  }

  void fetchScore() {
    setState(() {
      futureScore = ScoreDB().fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body: FutureBuilder<List<Score>>(
        future: futureScore,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No scores available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final score = snapshot.data![index];
                return ListTile(
                  title: Text(score.name),
                  subtitle: Text('Level: ${score.niveau}, Score: ${score.score}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
