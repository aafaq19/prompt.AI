import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_chat_app_tutorial/pages/history_page.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ChatGPTUI());
}

class ChatGPTUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  List<ChatMessage> history = []; // Store chat history

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Prompt AI",
    profileImage: "assets/image/plogo.png",
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndShowHistory();
    });
  }

  void _checkAndShowHistory() {
    if (history.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HistoryPage(history: history),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: _buildChatUI()),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 137, 122, 148),
      elevation: 3,
      title: const Text(
        "Prompt AI",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "History") {
              _showHistory();
            } else if (value == "Clear") {
              _clearChat();
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "History",
              child: Text("History"),
            ),
            const PopupMenuItem(
              value: "Clear",
              child: Text("Clear Chat"),
            ),
          ],
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  Widget _buildChatUI() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 238, 248),
              Color.fromARGB(255, 240, 230, 248),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: DashChat(
          currentUser: currentUser,
          messageOptions: const MessageOptions(
            currentUserContainerColor: Color.fromARGB(255, 240, 221, 208),
            containerColor: Colors.white,
            textColor: Colors.black,
            currentUserTextColor: Colors.black,
            messagePadding: EdgeInsets.all(12),
          ),
          inputOptions: InputOptions(
            inputDecoration: InputDecoration(
              hintText: "Type your message...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            trailing: [
              IconButton(
                onPressed: _sendMediaMessage,
                icon: const Icon(Icons.image,
                    color: Color.fromARGB(255, 151, 92, 190)),
              ),
            ],
          ),
          messages: messages,
          onSend: _sendMessage,
        ),
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
      history.add(chatMessage); // Add to history
    });

    try {
      String question = chatMessage.text;
      List<Uint8List>? images;

      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }

      gemini.streamGenerateContent(question, images: images).listen((event) {
        String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";

        if (response.isNotEmpty) {
          ChatMessage geminiMessage = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [geminiMessage, ...messages];
            history.add(geminiMessage); // Add to history
          });
        }
      }).onError((error) {
        print('Error receiving Gemini response: $error');
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  void _showHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(history: history),
      ),
    );
  }

  void _clearChat() {
    setState(() {
      messages.clear();
    });
  }
}
