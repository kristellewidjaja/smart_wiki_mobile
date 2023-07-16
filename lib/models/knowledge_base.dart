// import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/models/default_question.dart';

class KnowledgeBase {
  const KnowledgeBase(
      {required this.id,
      required this.subject,
      required this.imageUrl,
      // required this.backendAPIUri,
      required this.metadata,
      this.defaultQuestions = const []});

  final int id;
  final String subject;
  final String imageUrl;
  // final String backendAPIUri;
  final String metadata;
  final List<DefaultQuestion> defaultQuestions;

  KnowledgeBase.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        subject = json['subject'],
        metadata = json['metadata'],
        imageUrl = json['imageUrl'];
        defaultQuestion = json['defaultQuestion'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': _data,
      };
}
