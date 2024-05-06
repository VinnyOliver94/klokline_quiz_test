import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id;
  final String imageUrl;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final int score;

  Question({
    required this.id,
    required this.imageUrl,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.score,
  });

  factory Question.fromDocument(DocumentSnapshot document) {
    return Question(
      id: document.id,
      imageUrl: document['imageUrl'],
      question: document['question'],
      answers: List<String>.from(document['answers']),
      correctAnswer: document['correctAnswer'],
      score: document['score'],
    );
  }

  Future<void> save() async {
    await FirebaseFirestore.instance.collection('questions').doc(id).set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'question': question,
      'answers': answers,
      'correctAnswer': correctAnswer,
      'score': score,
    };
  }
}