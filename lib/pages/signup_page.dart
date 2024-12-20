import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/home5_page.dart';
import 'package:gemini_chat_app_tutorial/pages/login_ai.dart';
import 'package:gemini_chat_app_tutorial/pages/policy_page.dart';
import 'package:gemini_chat_app_tutorial/pages/terms_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SignUpUI());
}

class SignUpUI extends StatelessWidget {
  const SignUpUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Container(color: Colors.black),
            Container(
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Prompt.AI",
                      style: GoogleFonts.fascinate(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 8, 8, 8).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create An Account',
                          style: GoogleFonts.urbanist(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(221, 255, 255, 255),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 60),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Password Reminder'),
                                    content: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: 'Re-enter Password',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePageees()),
                                          );
                                        },
                                        child: Text('Continue'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.roboto(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('or',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/image/G.png')),
                              onPressed: () {},
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              icon: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/image/M.png')),
                              onPressed: () {},
                            ),
                            SizedBox(width: 20),
                            IconButton(
                              icon: SizedBox(
                                  width: 37,
                                  height: 24,
                                  child:
                                      Image.asset('assets/image/alogo1.png')),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: GoogleFonts.roboto(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: 'Log In',
                                    style: GoogleFonts.roboto(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 243, 237, 237),
                          ),
                          children: [
                            TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsOfUseTabPage()),
                                  );
                                },
                            ),
                            TextSpan(text: ' | '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PrivacyPolicyPage()),
                                  );
                                },
                            ),
                          ],
                        ),
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
