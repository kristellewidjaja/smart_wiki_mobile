import 'package:smart_wiki_ui/models/default_question.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';

const knowledgeBaseList = [
  KnowledgeBase(
    id: 1,
    title: 'GBN',
    imageUrl:
        'https://www.dailyherald.com/apps/pbcsi.dll/urlget?url=https://www.dailyherald.com/gfx/site/basketball/team_logos/Glenbrook-North.jpg&exactW=90&exactH=90&exactFit=crop&alignV=top',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'gbn',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about the early graduation policy',
        prompt: 'How do I graduate early?',
      ),
      DefaultQuestion(
        displayText: 'Ask about National Honors Society induction policy',
        prompt:
            'What activites do I have to do to join the National Honors Society?',
      ),
      DefaultQuestion(
        displayText: 'Ask about absence and makeup work policy',
        prompt: 'What do I do if I am absent? How do I makeup work?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 2,
    title: 'GBS',
    imageUrl:
        'https://patch.com/img/cdn20/users/22915293/20190830/045949/styles/patch_image/public/glenbrook-south-logo-1537201366-7288___30165130916.jpg?width=1200',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'gbs',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about the SELC program',
        prompt: 'What is the SELC Program?',
      ),
      DefaultQuestion(
        displayText: 'Ask about the benefits of being in the SELC program',
        prompt: 'What are the benefits of being in the SELC program?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 3,
    title: 'Brad Schneider',
    imageUrl:
        'https://www.govtrack.us/static/legislator-photos/412534-200px.jpeg',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'brad_schneider',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about Brad Schneider',
        prompt: 'Who is Brad Schneider?',
      ),
      DefaultQuestion(
        displayText: 'Ask about the STEAM Scholars Program',
        prompt: 'What is the STEAM Scholars program?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Brad\'s Bookworms Program',
        prompt: 'What is Brad\'s Bookworms program?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 4,
    title: 'Lane Tech',
    imageUrl:
        'https://i0.wp.com/lanetech.org/wp-content/uploads/2018/12/facebook-opengraph.jpg?fit=1200%2C630&ssl=1',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'lane_tech',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about the memorial garden',
        prompt: 'What is in the memorial garden?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Lane Tech history',
        prompt: 'What is Lane Tech\'s History?',
      ),
      DefaultQuestion(
        displayText: 'Ask about the demerit system',
        prompt: 'What is the demerit system? How do I get a demerit?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 5,
    title: 'Jones College Prep',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvhgxHozezAcgnCoZnb5tgLtxFm2DC20YuHjvIJbL-2g&s',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'jones_college_prep',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about the transfer policy',
        prompt: 'How do I transfer to Jones College Prep?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 6,
    title: 'Jan Schakowsky',
    imageUrl:
        'https://www.govtrack.us/static/legislator-photos/400360-200px.jpeg',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'jan_schakowsky',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about Jan\'s passport renewal assistance',
        prompt:
            'Can Janice help me with my passport renewal? What phone number can I call?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Jan\'s support for women',
        prompt: 'Does Janice support women?',
      ),
    ],
  ),
  KnowledgeBase(
    id: 7,
    title: 'Illinois Representatives',
    imageUrl:
        'https://starspangledflags.com/wp-content/uploads/il-stateflag-main.jpg',
    backendAPIUri: 'http://localhost:5001/chat',
    category: 'illinois_representatives',
    defaultQuestions: [
      DefaultQuestion(
        displayText: 'Ask about Jan\'s and Brad\'s passport renewal assistance',
        prompt:
            'Can Janice help me with my passport renewal? Can Brad help me with my passport renewal?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Jan\'s support for women',
        prompt: 'Does Janice support women?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Jan and Brad owning dogs',
        prompt: 'Do Brad and Janice own dogs?',
      ),
      DefaultQuestion(
        displayText: 'Who is Brad Schneider?',
        prompt: 'Who is Brad Schneider?',
      ),
      DefaultQuestion(
        displayText: 'Ask about the STEAM Scholars Program',
        prompt: 'What is the STEAM Scholars program?',
      ),
      DefaultQuestion(
        displayText: 'Ask about Brad\'s Bookworms Program',
        prompt: 'What is Brad\'s Bookworms program?',
      ),
    ],
  ),
];
