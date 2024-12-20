import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/1home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: Gifpage()));
}

class Gifpage extends StatefulWidget {
  const Gifpage({super.key});

  @override
  _CustomUIState createState() => _CustomUIState();
}

class _CustomUIState extends State<Gifpage> {
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
              const Color.fromARGB(255, 27, 14, 5), // First color
              const Color.fromARGB(255, 204, 171, 147), // Second color
            ],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                // Top Curved GIF Section (replaces image)
                ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.64,
                    width: MediaQuery.of(context).size.width,
                    color: Colors
                        .blue, // Background color if the GIF fails to load
                    child: Image.asset(
                      'assets/image/r7.png', // Replace with your GIF path
                      fit: BoxFit.cover,
                      // Cover the container's size
                    ),
                  ),
                ),

                // Text Section directly after ClipPath
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Simply type your message,\n and let AI do the rest",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Ask questions, share thoughts,\n or just chat—it's that easy",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
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
