import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PricingPage(),
    );
  }
}

class PricingPage extends StatefulWidget {
  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF303A50),
                  Color(0xFF2C3E50),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Colored Circle Overlays
          Positioned(
            top: -50,
            left: -80,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.blueAccent.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 120,
            right: -90,
            child: CircleAvatar(
              radius: 140,
              backgroundColor: Colors.orangeAccent.withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: -80,
            left: 50,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.tealAccent.withOpacity(0.3),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Explore Plans',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Unlock endless possibilities',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            height: 400,
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: _onPageChanged,
                              children: [
                                buildPlanCard(
                                  title: 'Basic',
                                  subtitle: 'For simple AI applications',
                                  price: '\$5.99',
                                  features: [
                                    '100 requests per day',
                                    'Free trial features access',
                                  ],
                                  buttonText: 'Get started',
                                  buttonColor:
                                      const Color.fromARGB(255, 245, 246, 248),
                                ),
                                buildPlanCard(
                                  title: 'Premium',
                                  subtitle:
                                      'For Promptists are pushing the boundaries of AI creativity',
                                  price: '\$9.99',
                                  features: [
                                    'Unlimited AI generation',
                                    'Full new features access',
                                    'Priority support',
                                  ],
                                  buttonText: 'Get started',
                                  buttonColor:
                                      const Color.fromARGB(255, 248, 246, 248),
                                  isPopular: true,
                                ),
                                buildPlanCard(
                                  title: 'Enterprise',
                                  subtitle: 'For fast-growing teams',
                                  price: 'Contact sale',
                                  features: [
                                    'Custom deployment',
                                    'Comprehensive usage data',
                                    'Training specialized models',
                                  ],
                                  buttonText: 'Contact sale',
                                  buttonColor:
                                      const Color.fromARGB(255, 245, 246, 248),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (index) =>
                                  buildDotIndicator(index == _currentPage),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPlanCard({
    required String title,
    required String subtitle,
    required String price,
    required List<String> features,
    required String buttonText,
    required Color buttonColor,
    bool isPopular = false,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPopular)
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                color: buttonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              maxLines: 2, // Limit to 2 lines
              overflow:
                  TextOverflow.ellipsis, // Adds ellipsis if text is too long
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {},
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDotIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
