import 'package:flutter/material.dart';

class KnowledgeBase {
  const KnowledgeBase(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.backendAPIUri});

  final int id;
  final String title;
  final String imageUrl;
  final String backendAPIUri;
}
