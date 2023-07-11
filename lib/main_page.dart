import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'knowledge_base_detail_page.dart';
import 'package:smart_wiki_ui/components/knowledge_base_item.dart';
// import 'package:smart_wiki_ui/models/categories.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';
import 'package:smart_wiki_ui/data/dummy_data.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<KnowledgeBase> _filteredKnowledgeBaseList = [];

  @override
  void initState() {
    _filteredKnowledgeBaseList = knowledgeBaseList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold with bottom navigation bar and 3 items in it with onTap function to navigate to different Pages(Home, Chat, Profile)
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
        title: const Text(
          'Smart Wiki',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {
                value = value.toLowerCase();
                setState(
                  () {
                    _filteredKnowledgeBaseList = knowledgeBaseList.where(
                      (knowledgeBase) {
                        var knowledgeBaseTitle =
                            knowledgeBase.title.toLowerCase();
                        return knowledgeBaseTitle.contains(value);
                      },
                    ).toList();
                  },
                );
              },
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredKnowledgeBaseList.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return KnowledgeBaseItem(
                  knowledgeBase: _filteredKnowledgeBaseList[index],
                );
              },
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //       // backgroundColor: Colors.deepPurple,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //       // backgroundColor: Colors.deepPurple,
      //     ),
      //   ],
      //   onTap: (index) {
      //     if (index == 0) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MainPage()),
      //       );
      //     } else if (index == 1) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => MainPage()),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
