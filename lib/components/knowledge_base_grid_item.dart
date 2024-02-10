import 'package:smart_wiki_ui/default_questions_page.dart';
import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/models/gradient_colors.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';
import 'package:smart_wiki_ui/models/hex_color.dart';

class KnowledgeBaseGridItem extends StatefulWidget {
  KnowledgeBaseGridItem({
    super.key,
    required this.knowledgeBase,
    required this.gradientColors,
  });

  final KnowledgeBase knowledgeBase;
  final GradientColors gradientColors;

  @override
  _KnowledgeBaseItemState createState() => _KnowledgeBaseItemState();
}

class _KnowledgeBaseItemState extends State<KnowledgeBaseGridItem> {
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
                gradientColors: widget.gradientColors,
              );
            },
          ),
        );
      },
      child: SizedBox(
        width: 130,
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
              child: Container(
                height: 154,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: HexColor(widget.gradientColors.getEndColor)
                            .withOpacity(0.6),
                        offset: const Offset(1.1, 4.0),
                        blurRadius: 8.0),
                  ],
                  gradient: LinearGradient(
                    colors: <HexColor>[
                      HexColor(widget.gradientColors.getStartColor),
                      HexColor(widget.gradientColors.getEndColor),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(54.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 70, left: 16, right: 16, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.knowledgeBase.subject,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'San Francisco',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.2,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'San Francisco',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 0.2,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 8,
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.asset(
                  avatarImagePath + widget.knowledgeBase.imageUrl,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
