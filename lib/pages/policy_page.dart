import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF56A7F2),
                Color.fromARGB(255, 120, 189, 253),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[Colors.red, Colors.blue, Colors.green],
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            child: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(
                  255, 0, 0, 0), // This color will be masked by ShaderMask
              size: 28,
            ),
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF56A7F2),
                Color(0xFFFFE6FA),
              ], // Gradient with blue on top
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Illustration or Header Icon
                Center(
                  child: Icon(
                    Icons.privacy_tip,
                    size: 80,
                    color: Color.fromARGB(255, 3, 36, 66),
                  ),
                ),
                SizedBox(height: 20),
                // Title
                Center(
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Scrollable Privacy Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPolicySection(
                          icon: Icons.info,
                          title: 'Information Collection',
                          content:
                              'We collect data to improve our service. This may include user data, usage data, and device data.',
                        ),
                        _buildPolicySection(
                          icon: Icons.data_usage,
                          title: 'Data Usage',
                          content:
                              'Data is used to personalize your experience, provide support, and enhance app performance. No data is sold or shared with third parties.',
                        ),
                        _buildPolicySection(
                          icon: Icons.lock,
                          title: 'Data Storage and Security',
                          content:
                              'Your data is securely stored and protected. We employ industry-standard security practices to safeguard your information.',
                        ),
                        _buildPolicySection(
                          icon: Icons.control_point,
                          title: 'User Control',
                          content:
                              'You have control over your data, including the ability to delete or update your information at any time.',
                        ),
                        _buildPolicySection(
                          icon: Icons.update,
                          title: 'Changes to Privacy Policy',
                          content:
                              'We may update this policy periodically. Any changes will be communicated through the app.',
                        ),
                      ],
                    ),
                  ), 
                ),
                SizedBox(height: 20),
                // Accept and Continue Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPolicySection({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Color(0xFF56CCF2)),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}    