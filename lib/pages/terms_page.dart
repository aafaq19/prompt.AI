import 'package:flutter/material.dart';

class TermsOfUseTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms of Use',
          style: TextStyle(color: Colors.white), // Custom title color
        ),
        backgroundColor:
            Colors.deepPurple, // Custom background color for AppBar
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white), // Custom icon color
      ),
      body: Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTermBox(
                        number: 1,
                        title: 'User Responsibilities',
                        content:
                            'Users must act responsibly and respect others while using the application.',
                      ),
                      _buildTermBox(
                        number: 2,
                        title: 'Acceptable Use',
                        content:
                            'Ensure the app is used as intended. Misuse may result in restrictions or bans.',
                      ),
                      _buildTermBox(
                        number: 3,
                        title: 'Intellectual Property',
                        content:
                            'All app content, including text and media, is protected by intellectual property laws.',
                      ),
                      _buildTermBox(
                        number: 4,
                        title: 'Account Security',
                        content:
                            'Keep your account details private to prevent unauthorized access.',
                      ),
                      _buildTermBox(
                        number: 5,
                        title: 'Changes to Terms',
                        content:
                            'We may update these terms periodically. You will be notified of major updates.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermBox({
    required int number,
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.deepPurple,
                child: Text(
                  '$number',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[700],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 56, 56, 56),
            ),
          ),
        ],
      ),
    );
  }
}
