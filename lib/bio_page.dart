import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/knowledge_base_detail_page.dart';

class BioPage extends StatefulWidget {
  @override
  State<BioPage> createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
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
        title: Text(
          'Women in AI',
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'San Francisco',
              fontWeight: FontWeight.bold),
        ),
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
        // title: Text(
        //   widget.knowledgeBase.subject,
        //   style: const TextStyle(
        //       color: Colors.black,
        //       fontFamily: 'San Francisco',
        //       fontWeight: FontWeight.bold),
        // ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          buildCard(
              'Mira Murati',
              Image.asset('assets/avatars/mira_murati.png'),
              'As Chief Technology Officer at OpenAI, a leading research institute for AI development, she drove the creation of ChatGPT - an incredibly influential language model that has completely changed our interactions with machines.'),
          buildCard(
              'Dr. Fei Fei Li',
              Image.asset('assets/avatars/fei_fei_li.jpeg'),
              'Dr. Fei-Fei Li is the inaugural Sequoia Professor in the Computer Science Department at Stanford University, and Co-Director of Stanford’s Human-Centered AI Institute. Dr. Li is the inventor of ImageNet and the ImageNet Challenge, a critical large-scale dataset and benchmarking effort that has contributed to the latest developments in deep learning and AI. In addition to her technical contributions, she is a national leading voice for advocating diversity in STEM and AI. She is co-founder and chairperson of the national non-profit AI4ALL aimed at increasing inclusion and diversity in AI education.')
        ],
      ),
    );
  }

  Widget buildCard(String title, Image image, String description) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          // color: Color.fromARGB(255, 115, 138, 230),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: image,
              ),
              ExpansionTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'San Francisco',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
