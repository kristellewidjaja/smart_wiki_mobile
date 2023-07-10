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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 181, 181, 181),
                Color.fromARGB(255, 201, 202, 201),
                Color.fromARGB(255, 222, 222, 222),
                Color.fromARGB(255, 242, 243, 242),
              ],
            ),
          ),
        ),
        title: Text(
          widget.knowledgeBase.title,
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildDefaultQuestionChips(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.skip_next),
            label: 'Skip',
            // backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right),
            label: 'Continue',
            // backgroundColor: Colors.deepPurple,
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KnowledgeBaseDetailPage(
                  knowledgeBase: widget.knowledgeBase,
                ),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KnowledgeBaseDetailPage(
                  knowledgeBase: widget.knowledgeBase,
                  defaultQuestionIndex: _selectedDefaultQuestionIndex,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildDefaultQuestionChips() {
    return List<Widget>.generate(
      widget.knowledgeBase.defaultQuestions.length,
      (index) => ChoiceChip(
        label: Text(widget.knowledgeBase.defaultQuestions[index].displayText),
        selectedColor: Colors.grey[300],
        selected: _selectedDefaultQuestionIndex == index,
        onSelected: (selected) {
          setState(
            () {
              _selectedDefaultQuestionIndex = selected ? index : 0;
            },
          );
        },
      ),
    ).toList();
  }
}
