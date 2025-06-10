import 'package:flutter/material.dart';

class QuizSection extends StatefulWidget {
  const QuizSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizSectionState createState() => _QuizSectionState();
}

class _QuizSectionState extends State<QuizSection> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Quiz Section'));
  }
}
