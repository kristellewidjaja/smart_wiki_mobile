import 'package:flutter/material.dart';
import 'package:smart_wiki_ui/main_page.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({
    super.key,
    required this.knowledgeBase,
  });

  final KnowledgeBase knowledgeBase;
  final avatarImagePath = 'assets/avatars/';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 235, 244, 215),
              Color.fromARGB(255, 181, 198, 224)
            ],
          ),
        ),
        padding: const EdgeInsets.only(right: 16, left: 5, top: 50),
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
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              backgroundImage:
                  AssetImage(avatarImagePath + knowledgeBase.imageUrl),
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
                    knowledgeBase.subject,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'San Francisco',
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
