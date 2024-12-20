import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/r5.jpg'), // Add your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blurred effect overlay
          Container(
            color: Colors.black.withOpacity(0.8),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skip button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      // Implement skip button functionality here
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                // Fancy text
                Text(
                  'FANCY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                // Main Text
                Text(
                  'Shop the most modern essentials',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                // Arrow Icon
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30.0,
                ),
                Spacer(),
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
