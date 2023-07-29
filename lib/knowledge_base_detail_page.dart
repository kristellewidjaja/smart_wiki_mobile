import 'dart:convert';
import 'dart:io';

import 'package:smart_wiki_ui/components/chat_app_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smart_wiki_ui/models/knowledge_base.dart';
import 'package:uuid/uuid.dart';
import 'package:smart_wiki_ui/models/chat_request.dart';

class KnowledgeBaseDetailPage extends StatefulWidget {
  const KnowledgeBaseDetailPage(
      {super.key, required this.knowledgeBase, this.defaultQuestionIndex = -1});

  final KnowledgeBase knowledgeBase;
  final int defaultQuestionIndex;

  @override
  State<KnowledgeBaseDetailPage> createState() =>
      _KnowledgeBaseDetailPageState();
}

class _KnowledgeBaseDetailPageState extends State<KnowledgeBaseDetailPage> {
  List<types.Message> _messages = [];
  final avatarImagePath = 'http://www.andywidjaja.com/assets/avatars/';

  // bool _isChatbotResponding = true;

  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  late types.User _chatbotUser;

  late TypingIndicatorOptions _showTypingIndictor;

  late InputTextFieldController _inputTextFieldController;

  final _hideTypingIndictor = const TypingIndicatorOptions(
    animationSpeed: Duration(milliseconds: 400),
    typingMode: TypingIndicatorMode.both,
    typingUsers: [],
  );

  dynamic _typingIndicatorOptions = const TypingIndicatorOptions(
    animationSpeed: Duration(milliseconds: 400),
    typingUsers: [],
  );

  @override
  void initState() {
    super.initState();

    _chatbotUser = types.User(
      firstName: 'Smart Assistant',
      imageUrl: avatarImagePath + widget.knowledgeBase.imageUrl,
      id: widget.knowledgeBase.id.toString(),
    );

    _showTypingIndictor = TypingIndicatorOptions(
      animationSpeed: const Duration(milliseconds: 400),
      typingMode: TypingIndicatorMode.both,
      typingUsers: [
        types.User(
          firstName: 'Smart Assistant',
          imageUrl: avatarImagePath + widget.knowledgeBase.imageUrl,
          id: widget.knowledgeBase.id.toString(),
        )
      ],
    );

    _inputTextFieldController = InputTextFieldController();

    if (widget.defaultQuestionIndex > -1) {
      _inputTextFieldController.text = widget
          .knowledgeBase.defaultQuestions[widget.defaultQuestionIndex].prompt;
    }

    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void sendQuery(String message) async {
    setState(() {
      _typingIndicatorOptions = _showTypingIndictor;
    });

    final request = ChatRequest(
      query: message,
      metadata: widget.knowledgeBase.metadata,
    );

    final url = Uri.http(
      // '10.0.0.20:5001',
      'localhost:5001',
      '/knowledgebases/chat',
    );

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: '',
      },
      body: jsonEncode(request),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      final chatResponse = jsonDecode(response.body);
      final responseMessage = types.TextMessage(
        author: _chatbotUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: chatResponse['data'],
      );

      setState(() {
        _typingIndicatorOptions = _hideTypingIndictor;
        _messages.insert(0, responseMessage);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to ask question');
    }
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);

    sendQuery(message.text);
  }

  // write a function to make an http call here to send message.text to your backend server

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(
    //   () {
    //     if (widget.defaultQuestionIndex > -1) {
    //       _messages = [
    //         types.TextMessage(
    //           author: _user,
    //           createdAt: DateTime.now().millisecondsSinceEpoch,
    //           id: const Uuid().v4(),
    //           text: widget.knowledgeBase
    //               .defaultQuestions[widget.defaultQuestionIndex].prompt,
    //         )
    //       ];
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        knowledgeBase: widget.knowledgeBase,
      ),
      body: Chat(
        messages: _messages,
        // onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        user: _user,
        inputOptions: InputOptions(
          textEditingController: _inputTextFieldController,
        ),
        typingIndicatorOptions: _typingIndicatorOptions,
      ),
    );
  }
}
