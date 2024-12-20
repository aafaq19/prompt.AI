import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

void main() {
  runApp(PasswordResetApp());
}

class PasswordResetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PasswordResetScreen(),
    );
  }
}

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _controller = TextEditingController();

  // Method to launch the email app with a mailto link
  Future<void> _launchMailClient(String email) async {
    final mailtoLink = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Password Reset Instructions', // Optional subject
    );

    if (await canLaunchUrl(mailtoLink)) {
      await launchUrl(mailtoLink);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not open email client")),
      );
    }
  }

  void _resetPassword() {
    String input = _controller.text.trim();

    if (input.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Password Reset"),
            content: GestureDetector(
              onTap: () {
                _launchMailClient(input); // Makes the email clickable
              },
              child: Text(
                "Instructions sent to: $input",
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 230, 41),
              Color.fromARGB(255, 255, 230, 41),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Add an image at the top
                SizedBox(
                  height: 200,
                  width: 800,
                  child: Image.asset('assets/image/FR.png'),
                ),

                SizedBox(height: 16),
                Text(
                  "Reset your password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Enter your Email address and we will send you instructions to reset your password.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: const Color.fromARGB(255, 10, 10, 10)),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email address",
                    labelStyle:
                        TextStyle(color: const Color.fromARGB(255, 26, 24, 24)),
                    filled: true,
                    fillColor:
                        const Color.fromARGB(255, 29, 28, 28).withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 15, 15, 15)),
                    ),
                  ),
                  style:
                      TextStyle(color: const Color.fromARGB(255, 15, 15, 15)),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text("Continue"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 4, 7, 10),
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 60), // Width: 200, Height: 60
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
