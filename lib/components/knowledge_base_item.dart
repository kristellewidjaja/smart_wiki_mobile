import 'package:smart_wiki_ui/default_questions_page.dart';
import 'package:flutter/material.dart';
// import 'package:smart_wiki_ui/data/dummy_data.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

class KnowledgeBaseItem extends StatefulWidget {
  const KnowledgeBaseItem({
    super.key,
    required this.knowledgeBase,
  });

  final KnowledgeBase knowledgeBase;

  @override
  _KnowledgeBaseItemState createState() => _KnowledgeBaseItemState();
}

class _KnowledgeBaseItemState extends State<KnowledgeBaseItem> {
  final avatarImagePath = 'assets/avatars/';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              // change here
              return DefaultQuestionsPage(
                knowledgeBase: widget.knowledgeBase,
              );

              // return KnowledgeBaseDetailPage(
              //   knowledgeBase: widget.knowledgeBase,
              // );
            },
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        avatarImagePath + widget.knowledgeBase.imageUrl),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.knowledgeBase.subject,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
