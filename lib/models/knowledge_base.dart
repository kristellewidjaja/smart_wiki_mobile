// import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/models/default_question.dart';

class KnowledgeBase {
  const KnowledgeBase(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.backendAPIUri,
      required this.category,
      this.defaultQuestions = const []});

  final int id;
  final String title;
  final String imageUrl;
  final String backendAPIUri;
  final String category;
  final List<DefaultQuestion> defaultQuestions;
}
