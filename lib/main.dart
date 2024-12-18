import 'package:flutter/material.dart';
import 'package:myapp/pages/nutrients_page.dart'; // For 'Hitung Kebutuhan Nutrisi'
import 'package:myapp/pages/nutrisi_page.dart'; // For 'Kebutuhan Nutrisi Harian'
import 'pages/bmi_page.dart';
import 'pages/menu_page.dart';
import 'pages/calories_page.dart';

void main() {
  runApp(const RenalistApp());
}

class RenalistApp extends StatelessWidget {
  const RenalistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renalist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Renalist.png', // Ensure this file exists
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome to Renalist',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Personalized Care for Your Kidney Health',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renalist - CKD Management'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1D33B0), // Dark, elegant blue for AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D2D6A), Color(0xFF1D4B91)], // Elegant deep blues
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // BMI Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF0D2D6A), // Elegant deep blue
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  shadowColor: const Color(0xFF0D2D6A).withOpacity(0.4),
                  elevation: 8, // Higher elevation for a premium feel
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BmiPage()),
                  );
                },
                child: const Text(
                  'Cek BMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Kebutuhan Nutrisi Harian Button (Navigates to NutrisiPage)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1D4B91), // Lighter blue for elegance
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF1D4B91).withOpacity(0.4),
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NutrisiPage()), // Navigating to NutrisiPage
                  );
                },
                child: const Text(
                  'Kebutuhan Nutrisi Harian',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Hitung Kebutuhan Nutrisi Button (Navigates to NutrientsPage)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1D4B91), // Lighter blue for elegance
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF1D4B91).withOpacity(0.4),
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NutrientsPage()), // Navigating to NutrientsPage
                  );
                },
                child: const Text(
                  'Hitung Kebutuhan Nutrisi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Menu Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF5174B9), // Cool, elegant blue
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF5174B9).withOpacity(0.4),
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
                child: const Text(
                  'Rekomendasi Menu CKD-friendly',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Calories Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF2A63A3), // Additional blue for calories
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF2A63A3).withOpacity(0.4),
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CaloriesPage()),
                  );
                },
                child: const Text(
                  'Hitung Kalori',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
