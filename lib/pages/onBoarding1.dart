import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/1home_page.dart';
import 'package:gemini_chat_app_tutorial/pages/onBoarding2.dart';
import 'package:google_fonts/google_fonts.dart';

class AiAvatarsScreen extends StatefulWidget {
  const AiAvatarsScreen({super.key});

  @override
  _AiAvatarsScreenState createState() => _AiAvatarsScreenState();
}

class _AiAvatarsScreenState extends State<AiAvatarsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late AnimationController _controller4;
  late AnimationController _controller5;

  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late Animation<double> _animation5;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers for each avatar
    _controller1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _controller2 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _controller3 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _controller4 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _controller5 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // Set up scaling animations
    _animation1 = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _animation2 = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _animation3 = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeInOut),
    );

    _animation4 = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller4, curve: Curves.easeInOut),
    );

    _animation5 = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller5, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 249, 246, 243), // Matches the design's white background
      body: Stack(
        children: [
          // Large center avatar with scaling animation
          Positioned(
            top: 180,
            left: 70,
            child: ScaleTransition(
              scale: _animation1,
              child: const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/image/r2.jpg"),
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 30,
            child: ScaleTransition(
              scale: _animation3,
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/image/R1.png"),
              ),
            ),
          ),
          // Another avatar towards bottom left with scaling animation
          Positioned(
            bottom: 150,
            left: 50,
            child: ScaleTransition(
              scale: _animation4,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/image/r10.png"),
              ),
            ),
          ),
          // Another avatar towards bottom right with scaling animation
          Positioned(
            bottom: 100,
            right: 50,
            child: ScaleTransition(
              scale: _animation5,
              child: const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/image/r3.jpg"),
              ),
            ),
          ),

          // Welcome message text
          Positioned(
            top: 400, // Adjust position based on design
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to the next level of conversation powered by AI',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                      fontSize: 26, // Font size
                      fontWeight: FontWeight.bold, // Font weight
                      color: Colors.black, // Font color
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Skip button with arrow
          Positioned(
            bottom: 22,
            left: 30,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        CustomUI(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },

                    transitionDuration:
                        const Duration(milliseconds: 400), // Adjust speed
                  ),
                );
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 4, 20, 34),
                ),
              ),
            ),
          ),

          Positioned(
            top: 730,
            right: 40,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ChatWithAIPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                                begin: const Offset(1, 0), end: Offset.zero)
                            .animate(animation),
                        child: child,
                      );
                    },

                    transitionDuration:
                        const Duration(milliseconds: 400), // Transition speed
                  ),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 18, 19),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
