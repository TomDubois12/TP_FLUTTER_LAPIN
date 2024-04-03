class Score{
  final int id;
  final int niveau;
  final String name;
  final int score;

  Score({
    required this.id,
    required this.niveau,
    required this.name,
    required this.score
  });

  factory Score.fromSqfliteDatabase(Map<String, dynamic> map) => Score(
    id: map['id']?.toInt() ?? 0,
    niveau: map['niveau']?.toInt() ?? 1,
    name: map['name'] ?? 'unknown',
    score: map['score']?.toInt() ?? 0,
  );
}