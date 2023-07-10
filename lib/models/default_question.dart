class DefaultQuestion {
  final String displayText;
  final String prompt;

  const DefaultQuestion({required this.displayText, required this.prompt});

  DefaultQuestion.fromJson(Map<String, dynamic> json)
      : displayText = json['displayText'],
        prompt = json['prompt'];

  Map<String, dynamic> toJson() =>
      {'displayText': displayText, 'prompt': prompt};
}
