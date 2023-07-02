import 'package:flutter/material.dart';

class KnowledgeBase {
  const KnowledgeBase(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.backendAPIUri,
      required this.category});

  final int id;
  final String title;
  final String imageUrl;
  final String backendAPIUri;
  final String category;
}
