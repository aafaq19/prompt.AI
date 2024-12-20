import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class NologinPage extends StatefulWidget {
  const NologinPage({super.key});

  @override
  State<NologinPage> createState() => _HomePageState();
}

class _HomePageState extends State<NologinPage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "",
    profileImage: "assets/image/plogo.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 193, 5),
        title: const Text("Prompt AI"),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Container(
      // Apply gradient background
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 228, 223, 217),
            Color.fromARGB(255, 247, 231, 223)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DashChat(
        inputOptions: InputOptions(), // Removed trailing image icon button
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages,
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });

    try {
      String question = chatMessage.text;

      // Stream responses from Gemini API
      gemini.streamGenerateContent(question).listen((event) {
        // Ensure that the content is not null
        String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";

        if (response.isNotEmpty) {
          // Check if the last message was from Gemini
          if (messages.isNotEmpty && messages.first.user == geminiUser) {
            setState(() {
              // Manually create a new message with updated text
              messages[0] = ChatMessage(
                user: geminiUser,
                createdAt: messages[0].createdAt,
                text: messages[0].text + response,
              );
            });
          } else {
            // Create a new message if Gemini was not the last sender
            ChatMessage geminiMessage = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response,
            );
            setState(() {
              messages = [geminiMessage, ...messages];
            });
          }
        }
      }).onError((error) {
        // Handle any errors during the stream
        print('Error receiving Gemini response: $error');
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
