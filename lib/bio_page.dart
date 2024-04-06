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
              'Dr. Fei-Fei Li',
              Image.asset('assets/avatars/fei_fei_li.jpeg'),
              'Dr. Fei-Fei Li is the inaugural Sequoia Professor in the Computer Science Department at Stanford University, and Co-Director of Stanford’s Human-Centered AI Institute. Dr. Li is the inventor of ImageNet and the ImageNet Challenge, a critical large-scale dataset and benchmarking effort that has contributed to the latest developments in deep learning and AI. In addition to her technical contributions, she is a national leading voice for advocating diversity in STEM and AI. She is co-founder and chairperson of the national non-profit AI4ALL aimed at increasing inclusion and diversity in AI education.'),
          buildCard(
              'Joy Buolamwini',
              Image.asset('assets/avatars/joy_buolamwini.jpeg'),
              'Dr. Joy Buolamwini uses art and research to illuminate the social implications of artificial intelligence. She founded the Algorithmic Justice League to create a world with more equitable and accountable technology. Her TED Featured Talk on algorithmic bias has over 1 million views. Her MIT thesis methodology uncovered large racial and gender bias in AI services from companies like Microsoft, IBM, and Amazon.'),
          buildCard(
              'Anima Anandkumar',
              Image.asset('assets/avatars/anima_anandkumar.jpeg'),
              'Anima Anandkumar is the Bren Professor of Computing at California Institute of Technology. Professor Anandkumar’s research interests are in the areas of large-scale machine learning, non-convex optimization and high-dimensional statistics. In particular, she has been spearheading the development and analysis of tensor algorithms for machine learning.'),
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
                padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
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
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
