import 'dart:io';
import 'package:smart_wiki_ui/bio_page.dart';
import 'package:smart_wiki_ui/models/gradient_colors.dart';
import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smart_wiki_ui/components/knowledge_base_grid_item.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<KnowledgeBase> _filteredKnowledgeBaseList = [];
  List<KnowledgeBase> _knowledgeBaseList = [];
  final List<GradientColors> gradientColors = [
    // dark blue
    GradientColors(
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    // pink
    GradientColors(
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    // light blue
    GradientColors(
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    // peach
    GradientColors(
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
  ];

  @override
  void initState() {
    super.initState();

    _getKnowledgeBaseList();
  }

  Future _getKnowledgeBaseList() async {
    final url = Uri.http(
      '10.0.0.16:5001',
      // 'localhost:5001',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.grey,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //       IconButton(
      //         icon: const Icon(Icons.person),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _getKnowledgeBaseList();
      //   },
      //   child: const Icon(Icons.person),
      //   backgroundColor: Color.fromARGB(255, 100, 121, 137),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            iconSize: 30,
            tooltip: 'See women in AI',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BioPage()));
            },
            icon: const Icon(Icons.person),
          ),
        ],
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 235, 244, 215),
                Color.fromARGB(255, 181, 198, 224)
              ],
            ),
          ),
        ),
        title: const Text(
          'FinGuru',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'San Francisco',
              fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
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
            child: RefreshIndicator(
              color: Colors.white,
              backgroundColor: Color.fromARGB(255, 100, 121, 137),
              strokeWidth: 3.0,
              onRefresh: _getKnowledgeBaseList,
              child: GridView.builder(
                itemCount: _filteredKnowledgeBaseList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return KnowledgeBaseGridItem(
                    knowledgeBase: _filteredKnowledgeBaseList[index],
                    gradientColors:
                        gradientColors[index % gradientColors.length],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
