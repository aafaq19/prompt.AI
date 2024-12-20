import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatMessage> history = [];

  @override
  void initState() {
    super.initState();

    // Add dummy history for testing
    history.add(ChatMessage(
      user: ChatUser(id: "0", firstName: "User"),
      text: "Hello!",
      createdAt: DateTime.now(),
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (history.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HistoryPage(history: history),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: const Center(child: Text("Home Page")),
    );
  }
}

class HistoryPage extends StatelessWidget {
  final List<ChatMessage> history;

  const HistoryPage({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat History")),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          ChatMessage message = history[index];
          return ListTile(
            title: Text(message.text),
            subtitle: Text(message.createdAt.toString()),
          );
        },
      ),
    );
  }
}
