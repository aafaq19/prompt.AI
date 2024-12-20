import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeDesignScreen(),
    );
  }
}

class SafeDesignScreen extends StatelessWidget {
  const SafeDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Stack(
        children: [
          // Background Container with color
          Container(
            color: Color(0xFFADD8E6), // Light blue color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    // For rounded image container
                    child: Container(
                      width: 250,
                      height: 250,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              'assets/image/r6.png', // Replace with the correct path of the image
                              width: 300,
                              height: 400,
                            ),
                          ), 
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space between the image and the text
                  // Add text below the image
                  Text(
                    'Secure your path to success!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Skip button at the top-right corner
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                // Handle skip action
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
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
