import 'package:flutter/material.dart';

class NutrisiPage extends StatefulWidget {
  const NutrisiPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NutrisiPageState createState() => _NutrisiPageState();
}

class _NutrisiPageState extends State<NutrisiPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _proteinRequirement = '';

  void _calculateNutritionalNeeds() {
    final String name = _nameController.text;
    final String ageText = _ageController.text;
    final String weightText = _weightController.text;

    // Validate inputs
    if (name.isNotEmpty && ageText.isNotEmpty && weightText.isNotEmpty) {
      final int? age = int.tryParse(ageText);
      final double? weight = double.tryParse(weightText);

      if (age != null && weight != null && age > 0 && weight > 0) {
        // Calculate protein requirements
        final double protein = weight * 0.6; // 0.6g protein per kg of body weight
        setState(() {
          _proteinRequirement =
              'Hi $name, your daily protein requirement is ${protein.toStringAsFixed(1)} grams.';
        });
      } else {
        setState(() {
          _proteinRequirement = 'Please enter valid age and weight values.';
        });
      }
    } else {
      setState(() {
        _proteinRequirement = 'Please fill in all fields.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Kebutuhan Nutrisi'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A3C72),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2A3D69), Color(0xFF4A6D9D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name input field
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Enter Name',
                hintText: 'Enter your name',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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

            // Age input field
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Enter Age',
                hintText: 'Enter your age',
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
                  color: Colors.white,
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

            // Calculate button
            ElevatedButton(
              onPressed: _calculateNutritionalNeeds,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF4A6D9D),
              ),
              child: const Text(
                'Calculate Protein Needs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Display protein requirement
            if (_proteinRequirement.isNotEmpty)
              Text(
                _proteinRequirement,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
