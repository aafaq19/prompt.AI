import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/login_ai.dart';
import 'package:gemini_chat_app_tutorial/pages/nologin_page.dart';
import 'package:gemini_chat_app_tutorial/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatWithAIPage(),
    );
  }
}

class ChatWithAIPage extends StatefulWidget {
  @override
  _ChatWithAIPageState createState() => _ChatWithAIPageState();
}

class _ChatWithAIPageState extends State<ChatWithAIPage> {
  List<String> labels = [
    'Technology',
    'Education',
    'Business',
    'Entertainment',
    'Travel',
    'Food & Recipes',
    'Fitness',
    'Mental Health',
    'Productivity',
    'Career Guidance',
    'AI & Automation',
    'Science & Innovation',
    'Finance',
    'Social Media Trends',
    'Sports',
  ];

  List<double> opacityValues = [];

  @override
  void initState() {
    super.initState();
    opacityValues = List.filled(labels.length, 0.0);
    _animateTagBubbles();
  }

  // Function to animate each TagBubble with a delay
  void _animateTagBubbles() {
    for (int i = 0; i < labels.length; i++) {
      Future.delayed(Duration(milliseconds: i * 88), () {
        setState(() {
          opacityValues[i] = 1.0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9A6FFF), // First color
              Color.fromARGB(255, 0, 0, 0), // Second color
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Image.asset(
                'assets/image/r9.png',
                height: 200,
                width: 400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Have a Conversation with AI",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 35),
            // Tag Bubbles Section with Animation
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(labels.length, (index) {
                return AnimatedOpacity(
                  opacity: opacityValues[index],
                  duration: Duration(milliseconds: 500),
                  child: TagBubble(label: labels[index]),
                );
              }),
            ),
            Expanded(child: Container()),
            // Login and Register Buttons
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      LoginScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final curvedAnimation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                );

                                return FadeTransition(
                                  opacity: curvedAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(
                                  milliseconds:
                                      600), // Longer duration for smoothness
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9A6FFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      SignUpUI(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                final curvedAnimation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                );

                                return FadeTransition(
                                  opacity: curvedAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(
                                  milliseconds:
                                      600), // Longer duration for smoothness
                            ),
                          );
                        },
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Sign up for Advanced Features',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Get access to exclusive features like personalized AI recommendations with illustrative images by signing up.',
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          NologinPage(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutQuad,
                                          ),
                                          child: child,
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                    ),
                                  );
                                },
                                child: Text('Continue'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          SignUpUI(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutQuad,
                                          ),
                                          child: child,
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 800),
                                    ),
                                  );
                                },
                                child: Text('Sign Up Now'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Continue without an account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                        decoration: TextDecoration.underline,
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

class TagBubble extends StatelessWidget {
  final String label;

  TagBubble({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
