import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/knowledge_base_detail_page.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

class DefaultQuestionsPage extends StatefulWidget {
  const DefaultQuestionsPage({super.key, required this.knowledgeBase});

  final KnowledgeBase knowledgeBase;

  @override
  State<DefaultQuestionsPage> createState() => _DefaultQuestionsPageState();
}

class _DefaultQuestionsPageState extends State<DefaultQuestionsPage> {
  int _selectedDefaultQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Wiki'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _buildDefaultQuestionChips(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnowledgeBaseDetailPage(
                          knowledgeBase: widget.knowledgeBase,
                        ),
                      ),
                    );
                  },
                  child: const Text('Skip'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnowledgeBaseDetailPage(
                          knowledgeBase: widget.knowledgeBase,
                          defaultQuestionIndex: _selectedDefaultQuestionIndex,
                        ),
                      ),
                    );
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDefaultQuestionChips() {
    return List<Widget>.generate(
      widget.knowledgeBase.defaultQuestions.length,
      (index) => ChoiceChip(
        label: Text(widget.knowledgeBase.defaultQuestions[index].displayText),
        selected: _selectedDefaultQuestionIndex == index,
        onSelected: (selected) {
          setState(() {
            _selectedDefaultQuestionIndex = selected ? index : 0;
          });
        },
      ),
    ).toList();
  }
}
