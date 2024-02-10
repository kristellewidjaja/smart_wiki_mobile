import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/knowledge_base_detail_page.dart';
import 'package:smart_wiki_ui/models/gradient_colors.dart';
import 'package:smart_wiki_ui/models/hex_color.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

class DefaultQuestionsPage extends StatefulWidget {
  const DefaultQuestionsPage(
      {super.key, required this.knowledgeBase, required this.gradientColors});

  final KnowledgeBase knowledgeBase;
  final GradientColors gradientColors;

  @override
  State<DefaultQuestionsPage> createState() => _DefaultQuestionsPageState();
}

class _DefaultQuestionsPageState extends State<DefaultQuestionsPage> {
  final controller = ScrollController();
  int _selectedDefaultQuestionIndex = 0;
  final double itemSize = 100.0;
  final List<Color> cardColors = [
    Color.fromARGB(255, 255, 149, 0),
    Color.fromARGB(255, 86, 207, 225),
    Color.fromARGB(255, 199, 125, 255),
    Color.fromARGB(255, 255, 0, 84),
  ];

  void _scrollListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

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
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'San Francisco',
              fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                                    fontSize: 20,
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                'Tap Skip to ask your own question or select one of the default questions and tap Continue',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.normal),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'San Francisco',
                                        fontWeight: FontWeight.normal),
                                  ),
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
            ],
          ),
          Expanded(
              child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: widget.knowledgeBase.defaultQuestions.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDefaultQuestionIndex = index;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            height: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  HexColor(widget.gradientColors.startColor),
                                  HexColor(widget.gradientColors.endColor),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                tileMode: TileMode.clamp,
                              ),
                              // color: widget.color,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  widget.knowledgeBase.defaultQuestions[index]
                                      .displayText,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'San Francisco',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 270,
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.skip_next),
            label: 'Skip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right),
            label: 'Continue',
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

  // new method

  Color getCardColor(int index) {
    return cardColors[index % cardColors.length];
  }

  List<Widget> _buildDefaultQuestionChips() {
    return List<Widget>.generate(
      widget.knowledgeBase.defaultQuestions.length,
      (index) => ChoiceChip(
        label: Text(
          widget.knowledgeBase.defaultQuestions[index].displayText,
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'San Francisco',
              fontSize: 14,
              fontWeight: FontWeight.normal),
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
