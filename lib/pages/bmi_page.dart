import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  // Method to calculate BMI
  void _calculateBMI() {
    final String heightText = _heightController.text;
    final String weightText = _weightController.text;

    // Validate input for height and weight
    if (heightText.isNotEmpty && weightText.isNotEmpty) {
      final double? height = double.tryParse(heightText);
      final double? weight = double.tryParse(weightText);

      // Validate parsed values
      if (height != null && weight != null && height > 0 && weight > 0) {
        // Calculate BMI (height in meters)
        final double bmi = weight / ((height / 100) * (height / 100));
        setState(() {
          _bmiResult = bmi.toStringAsFixed(2);

          // Determine BMI category
          if (bmi < 18.5) {
            _bmiCategory = 'Underweight';
          } else if (bmi >= 18.5 && bmi < 24.9) {
            _bmiCategory = 'Normal weight';
          } else if (bmi >= 25 && bmi < 29.9) {
            _bmiCategory = 'Overweight';
          } else {
            _bmiCategory = 'Obesity';
          }
        });
      } else {
        setState(() {
          _bmiResult = '';
          _bmiCategory = 'Please enter valid numbers for height and weight.';
        });
      }
    } else {
      setState(() {
        _bmiResult = '';
        _bmiCategory = 'Please enter both height and weight.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek BMI'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A3C72), // Elegant deep blue color
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2A3D69), Color(0xFF4A6D9D)], // Subtle blue gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Height input field (in centimeters)
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Enter Height (cm)',
                hintText: 'Enter your height in centimeters',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Label color changed to white
                ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2), // Slight transparency
              ),
            ),
            const SizedBox(height: 16),

            // Weight input field
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                hintText: 'Enter your weight in kilograms',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Label color changed to white
                ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2), // Slight transparency
              ),
            ),
            const SizedBox(height: 32),

            // Calculate BMI button
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF4A6D9D), // Subtle blue button
              ),
              child: const Text(
                'Calculate BMI',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Display BMI result
            if (_bmiResult.isNotEmpty)
              Text(
                'Your BMI: $_bmiResult',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 8),
            if (_bmiCategory.isNotEmpty)
              Text(
                'Category: $_bmiCategory',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
