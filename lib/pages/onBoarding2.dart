import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/1home_page.dart';
import 'package:gemini_chat_app_tutorial/pages/onBoarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: CustomUI()));
}

class CustomUI extends StatefulWidget {
  @override
  _CustomUIState createState() => _CustomUIState();
}

class _CustomUIState extends State<CustomUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Apply a linear gradient background
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Start gradient from top left
            end: Alignment.bottomRight, // End gradient at bottom right
            colors: [
              const Color.fromARGB(255, 160, 177, 219), // First color
              const Color.fromARGB(255, 10, 21, 34), // Second color
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // Top Curved Image Section (replaces video)
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.64,
                    width: MediaQuery.of(context).size.width,
                    color: Colors
                        .blue, // Background color if the image fails to load
                    child: Image.asset(
                      'assets/image/r6.png', // Replace with your image path
                      fit: BoxFit.cover, // Cover the container's size
                    ),
                  ),
                ),

                // Text Section directly after ClipPath
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Engage in dynamic chats that learn and evolve with every conversation",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 40), // Adds vertical gap between the texts

                      Text(
                        "Meet your AI companion, designed to assist you in every chat",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            // Skip button at the bottom-right
            Positioned(
              top: 730,
              right: 300,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Gifpage(),
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
                      ));
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Color.fromARGB(255, 192, 206, 221),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 730,
              right: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
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
                          const Duration(milliseconds: 400), // Adjust speed
                    ),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color.fromARGB(255, 192, 206, 221),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for the curve
class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
