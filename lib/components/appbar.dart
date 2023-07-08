import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:smart_wiki_ui/data/dummy_data.dart';
import 'package:smart_wiki_ui/main_page.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.knowledgeBase,
  });

  final KnowledgeBase knowledgeBase;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(knowledgeBase.imageUrl),
                maxRadius: 20,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      knowledgeBase.title,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              // Icon(
              //   Icons.more_vert,
              //   color: Colors.grey.shade700,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
