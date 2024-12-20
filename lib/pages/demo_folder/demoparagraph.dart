import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Make sure to add this package in pubspec.yaml

void main() {
  runApp(const MyApparagraph());
}

class MyApparagraph extends StatelessWidget {
  const MyApparagraph({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Text Layout'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              // Heading
              Text(
                'Heading',
                style: GoogleFonts.happyMonkey(
                  textStyle: TextStyle(
                    fontSize: 32, // Font size for heading
                    fontWeight: FontWeight.bold, // Bold for heading
                  ),
                ),
              ),
              SizedBox(height: 16), // Space between heading and subheading

              // Subheading
              Text(
                'Subheading',
                style: GoogleFonts.gajrajOne(
                  textStyle: TextStyle(
                    fontSize: 24, // Font size for subheading
                    fontWeight: FontWeight.w500, // Medium weight for subheading
                    color: Colors.grey[700], // Lighter color for subheading
                  ),
                ),
              ),
              SizedBox(height: 12), // Space between subheading and paragraph

              // Paragraph
              Text(
                'This is a paragraph that provides more detailed information. It describes the content in more depth and usually spans multiple lines. You can adjust the spacing, font size, and style as needed.',
                style: GoogleFonts.ibarraRealNova(
                  textStyle: TextStyle(
                    fontSize: 16, // Font size for paragraph
                    fontWeight:
                        FontWeight.normal, // Normal weight for paragraph
                    color: Colors.black, // Default black color
                    height: 1.5, // Line height for better readability
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
