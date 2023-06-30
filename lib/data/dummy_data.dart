import 'package:smart_wiki_ui/models/knowledge_base.dart';

const knowledgeBaseList = [
  KnowledgeBase(
      id: 1,
      title: 'GBN',
      imageUrl:
          'https://www.dailyherald.com/apps/pbcsi.dll/urlget?url=https://www.dailyherald.com/gfx/site/basketball/team_logos/Glenbrook-North.jpg&exactW=90&exactH=90&exactFit=crop&alignV=top',
      backendAPIUri: 'http://localhost:5001/chat'),
  KnowledgeBase(
      id: 2,
      title: 'GBS',
      imageUrl:
          'https://patch.com/img/cdn20/users/22915293/20190830/045949/styles/patch_image/public/glenbrook-south-logo-1537201366-7288___30165130916.jpg?width=1200',
      backendAPIUri: 'http://localhost:5001/chat'),
  KnowledgeBase(
      id: 3,
      title: 'Brad Schneider',
      imageUrl:
          'https://www.govtrack.us/static/legislator-photos/412534-200px.jpeg',
      backendAPIUri: 'http://localhost:5002/chat'),
  KnowledgeBase(
      id: 4,
      title: 'Lane Tech',
      imageUrl:
          'https://i0.wp.com/lanetech.org/wp-content/uploads/2018/12/facebook-opengraph.jpg?fit=1200%2C630&ssl=1',
      backendAPIUri: 'http://localhost:5001/chat'),
];
