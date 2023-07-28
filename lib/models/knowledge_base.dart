// import 'package:flutter/material.dart';

import 'package:smart_wiki_ui/models/default_question.dart';

class KnowledgeBase {
  KnowledgeBase(
      this.id,
      this.subject,
      this.imageUrl,
      // required this.backendAPIUri,
      this.metadata,
      [this.defaultQuestions = const []]);

  int id;
  String subject;
  String imageUrl;
  // final String backendAPIUri;
  String metadata;
  List<DefaultQuestion> defaultQuestions;

  factory KnowledgeBase.fromJson(dynamic json) {
    if (json['default_questions'] != null) {
      var defaultQuestionsJson = json['default_questions'] as List;
      List<DefaultQuestion> _defaultQuestions = defaultQuestionsJson
          .map((defaultQuestionJson) =>
              DefaultQuestion.fromJson(defaultQuestionJson))
          .toList();

      return KnowledgeBase(
          json['id'] as int,
          json['subject'] as String,
          json['image_url'] as String,
          json['metadata'] as String,
          _defaultQuestions);
    } else {
      return KnowledgeBase(json['id'] as int, json['subject'] as String,
          json['image_url'] as String, json['metadata'] as String, []);
    }
  }

  // KnowledgeBase.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       subject = json['subject'],
  //       metadata = json['metadata'],
  //       imageUrl = json['image_url'],
  //       defaultQuestions = json['default_questions'].cast(List<KnowledgeBase>);
  //  defaultQuestions =
  //     json['default_questions'].map((dynamic defaultQuestion) {
  //   return DefaultQuestion.fromJson(defaultQuestion);
  // }).toList();

  // Map<String, dynamic> toJson() => {
  //       'status': status,
  //       'data': _data,
  //     };
}
