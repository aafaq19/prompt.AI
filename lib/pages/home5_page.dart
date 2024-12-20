import 'package:flutter/material.dart';
import 'package:gemini_chat_app_tutorial/pages/home_page.dart';
import 'package:gemini_chat_app_tutorial/pages/premium_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageees(),
    );
  }
}

class HomePageees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F2E), // Dark background color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // Set the radius as needed
                child: Container(
                  color: Color.fromARGB(
                      255, 207, 233, 188), // Light green background color
                  child: Padding(
                    padding: const EdgeInsets.all(
                        16.0), // Add padding for better layout
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hey,',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20),
                            ),
                            Text(
                              'Mr. Saqalain',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          child: Icon(Icons.menu,
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16), // Smaller gap

              // Premium Plan section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 214, 252),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Premium Plan',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Unlock your AI chatbot & get all premium features',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    PricingPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                        begin: const Offset(1, 0),
                                        end: Offset.zero)
                                    .animate(animation),
                                child: child,
                              );
                            },

                            transitionDuration: const Duration(
                                milliseconds: 400), // Transition speed
                          ),
                        );
                      },
                      child: Text(
                        'Get premium now',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16), // Gap between containers

              // Start the Conversation section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 226, 133),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start the Conversation',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Chat with our AI chatbot and ask anything!',
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () {
                        // Navigate to the chatbot interface
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Text(
                        'Start Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16), // Adjusted gap

              // Explore section
              Text(
                'Explore',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 251, 251),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5), // Adjusted gap
              Expanded(
                // GridView inside an Expanded widget to avoid overflow
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    childAspectRatio: 0.75, // Adjust height vs width ratio
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return productItem(
                        products[index]['title']!,
                        products[index]['icon'] as IconData,
                        products[index]['description']!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build the explore product item
  Widget productItem(String title, IconData icon, String description) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Custom Oval Background Shape with Gradient and Shadow
        Positioned(
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color.fromARGB(255, 213, 239, 255),
                  Color.fromARGB(255, 213, 239, 255 )
                ],
                center: Alignment(-0.6, -0.6),
                radius: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(60),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 29, 29, 28).withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
        ),

        // Product Title, Icon, and Additional Text
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Product Title Text
            Text(
              title,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Space between text and icon

            // Product Icon
            Icon(
              icon,
              size: 50,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            SizedBox(height: 10), // Space between icon and additional text

            // Additional description
            Text(
              description,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

// List of products with title, icon, and description
List<Map<String, dynamic>> products = [
  {'title': 'Code', 'icon': Icons.code, 'description': 'Write programs easily'},
  {
    'title': 'Document',
    'icon': Icons.edit_document,
    'description': 'Edit documents fast'
  },
  {
    'title': 'Image',
    'icon': Icons.photo,
    'description': 'Great picture quality'
  },
  {
    'title': 'Summarize text',
    'icon': Icons.camera_alt,
    'description': 'Outline overview'
  },
  {
    'title': 'Gaming Chair',
    'icon': Icons.chair,
    'description': 'Comfortable seating'
  },
  {
    'title': 'Monitor',
    'icon': Icons.desktop_windows,
    'description': '4K Ultra HD display'
  },
];
