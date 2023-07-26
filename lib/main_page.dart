import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'knowledge_base_detail_page.dart';
import 'package:smart_wiki_ui/components/knowledge_base_item.dart';
// import 'package:smart_wiki_ui/models/categories.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<KnowledgeBase> _filteredKnowledgeBaseList = [];
  List<KnowledgeBase> _knowledgeBaseList = [];

  @override
  void initState() {
    super.initState();

    _intializeKnowledgeBaseList();
  }

  void _intializeKnowledgeBaseList() async {
    final url = Uri.http(
      'localhost:5001',
      '/knowledgebases',
    );

    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: '',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(jsonDecode(response.body));
      final List<dynamic> knowledgeBaseListResponse = jsonDecode(response.body);
      // return [];
      _knowledgeBaseList = knowledgeBaseListResponse
          .map((knowledgeBase) => KnowledgeBase.fromJson(knowledgeBase))
          .toList();
      setState(() {
        _filteredKnowledgeBaseList = _knowledgeBaseList;
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to retrieve knowledge base list');
    }
  }

  // Future<List<KnowledgeBase>> _getKnowledgeBaseList() async {
  //   final url = Uri.http('localhost:5001', '/knowledgebases');

  //   final response = await http.get(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print(jsonDecode(response.body));
  //     final knowledgeBaseListResponse = jsonDecode(response.body);
  //     // return [];
  //     final knowledgeBaseList = knowledgeBaseListResponse
  //         .map((knowledgeBase) => KnowledgeBase.fromJson(knowledgeBase))
  //         .toList();
  //     // return knowledgeBaseList;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to retrieve knowledge base list');
  //   }
  // }

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
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'San Francisco',
              fontWeight: FontWeight.bold),
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
                    _filteredKnowledgeBaseList = _knowledgeBaseList.where(
                      (knowledgeBase) {
                        var knowledgeBaseTitle =
                            knowledgeBase.subject.toLowerCase();
                        return knowledgeBaseTitle.contains(value);
                      },
                    ).toList();
                  },
                );
              },
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontFamily: 'San Francisco',
                ),
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
