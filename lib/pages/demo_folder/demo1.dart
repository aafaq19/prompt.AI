import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlantScreen(),
    );
  }
}

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9E4CC), // Light green background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Greeting, Time, Weather
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Everyone...",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "kegiatan hari ini gimana?\nfun or boring?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "13.00",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.cloud, color: Colors.black54),
                          SizedBox(width: 5),
                          Text(
                            "34°C",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // Grid Section: Cards with images and labels
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    locationCard('assets/image/r6.png', 'Fountain Park',
                        'air mancur yang dikelilingi'),
                    locationCard('assets/image/r6.png', 'Gathering field',
                        'tempat kumpul pelajar'),
                    locationCard('assets/image/r6.png', 'Backyard school',
                        'halaman belakang sekolah'),
                    locationCard('assets/image/r6.png', 'Road Access',
                        'jalan menuju titik tujuan'),
                  ],
                ),
              ),
            ),
            // Bottom Navigation Bar
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.bookmark_border, size: 30, color: Colors.black54),
                  Icon(Icons.home, size: 30, color: Colors.black),
                  Icon(Icons.add_box_outlined, size: 30, color: Colors.black54),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to create each location card
  Widget locationCard(String imagePath, String title, String description) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular image
          ClipOval(
            child: Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          // Title
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 5),
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
