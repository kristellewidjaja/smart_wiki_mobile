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
                Color.fromARGB(255, 34, 30, 36),
                Color.fromARGB(255, 83, 97, 108),
                Color.fromARGB(255, 100, 121, 137),
                Color.fromARGB(255, 106, 129, 146),
              ],
            ),
          ),
        ),
        title: Text(
          widget.knowledgeBase.subject,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Container(
              //   color: const Color.fromARGB(255, 106, 129, 146),
              //   child: const Padding(
              //     padding: EdgeInsets.all(16.0),
              //     child: Text(
              //       'Select a default question',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromARGB(50, 106, 129, 146),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                      onPressed: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Help',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                'Tap Skip to ask your own question \n\nOr select one of the default questions and tap Continue',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          ),
                      icon: const Icon(
                        Icons.question_mark_rounded,
                        color: Colors.black,
                      )),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () => showDialog(
              //     context: context,
              //     builder: (context) => AlertDialog(
              //       title: const Text('Help'),
              //       content:
              //           const Text('Select a default question to continue'),
              //       actions: [
              //         TextButton(
              //           onPressed: () => Navigator.pop(context, 'Cancel'),
              //           child: const Text('Cancel'),
              //         ),
              //         TextButton(
              //           onPressed: () => Navigator.pop(context, 'OK'),
              //           child: const Text('OK'),
              //         ),
              //       ],
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     fixedSize: const Size(50, 50),
              //     shape: const CircleBorder(),
              //   ),
              //   child: const Icon(
              //     Icons.question_mark,
              //     color: Colors.black,
              //   ),
              // )
            ],
          ),
          Expanded(
            child: ListView(
              children: _buildDefaultQuestionChips(),
            ),
          ),
        ],
      ),

      // Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: ListView(
      //     children: _buildDefaultQuestionChips(),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
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
        label: Text(
          widget.knowledgeBase.defaultQuestions[index].displayText,
          style: const TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal),
        ),
        selectedColor: const Color.fromARGB(125, 106, 129, 146),
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
