import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gemini_chat_app_tutorial/pages/onBoarding1.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _visible = false; // Track visibility for opacity animation

  @override
  void initState() {
    super.initState();

    // Timer to delay the splash screen for 1 second
    Timer(Duration(seconds: 1), () {
      setState(() {
        _visible = true; // Start the opacity animation after a delay
      });
    });

    // Timer to navigate to the next screen after 10 seconds
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const AiAvatarsScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 249, 246, 243), // Light Blue
              Color.fromARGB(255, 245, 245, 220), // Deeper Blue
            ],
            begin: Alignment.topLeft, // Gradient starts from the top left
            end: Alignment.bottomRight, // Ends at the bottom right
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              // Display GIF
              Image.asset('assets/image/gif2.gif'), // Load the ghost animation
              SizedBox(height: 20), // Space between image and text
              // Center the animated text
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.8, end: 1.0), // Scale animation
                duration: Duration(seconds: 2), // Animation duration
                builder: (context, double scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0, // Fade-in effect
                      duration: Duration(seconds: 3), // Fade-in duration
                      child: Text(
                        "Prompt.AI",
                        style: GoogleFonts.fascinate(
                          textStyle: TextStyle(
                            fontSize: 55.0, // Font size
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // Font color
                            fontWeight: FontWeight.bold, // Font weight
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
