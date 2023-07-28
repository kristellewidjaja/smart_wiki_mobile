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
  final controller = ScrollController();
  int _selectedDefaultQuestionIndex = 0;
  final double itemSize = 100.0;

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
                    final itemOffset = itemSize * index;
                    final difference = controller.offset - itemOffset;
                    final percent = 1 - (difference / (itemSize / 2));
                    double opacity = percent;
                    if (opacity > 1.0) opacity = 1.0;
                    if (opacity < 0.0) opacity = 0.0;
                    double scale = percent;
                    if (scale > 1.0) scale = 1.0;

                    return Opacity(
                      opacity: opacity,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDefaultQuestionIndex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(8.0),
                            height: itemSize,
                            decoration: BoxDecoration(
                              color: _selectedDefaultQuestionIndex == index
                                  ? Color.fromARGB(255, 106, 129, 146)
                                  : Color.fromARGB(125, 106, 129, 146),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 1.0,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.knowledgeBase.defaultQuestions[index]
                                    .displayText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'San Francisco',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   height: 150,
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [Colors.white, Colors.transparent],
              //     ),
              //   ),
              // ),
            ],
          )
              // ListView(
              //   children: _buildDefaultQuestionChips(),
              // ),
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
