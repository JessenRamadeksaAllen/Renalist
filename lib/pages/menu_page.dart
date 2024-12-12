import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _menuRecommendation = '';

  void _generateMenuRecommendation() {
    final String ageText = _ageController.text;
    final String weightText = _weightController.text;

    if (ageText.isNotEmpty && weightText.isNotEmpty) {
      final int? age = int.tryParse(ageText);
      final double? weight = double.tryParse(weightText);

      if (age != null && weight != null && age > 0 && weight > 0) {
        // Generate recommendations based on weight and age
        setState(() {
          if (age < 18) {
            _menuRecommendation =
                'Rekomendasi: Bubur ayam tanpa MSG, jus buah rendah kalium seperti apel, dan telur rebus.';
          } else if (age < 60) {
            _menuRecommendation =
                'Rekomendasi: Nasi putih, ikan panggang rendah garam, dan sayur bening bayam.';
          } else {
            _menuRecommendation =
                'Rekomendasi: Bubur kacang hijau tanpa gula, ikan kukus, dan tumis labu siam.';
          }
        });
      } else {
        setState(() {
          _menuRecommendation = 'Masukkan data usia dan berat badan yang valid.';
        });
      }
    } else {
      setState(() {
        _menuRecommendation = 'Harap masukkan usia dan berat badan.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3C72),
        title: const Text(
          'Rekomendasi Menu CKD-friendly',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Input field for age
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Usia',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Input field for weight
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Berat Badan (kg)',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 32),

            // Button to generate menu recommendation
            ElevatedButton(
              onPressed: _generateMenuRecommendation,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: const Color(0xFF4A6D9D),
              ),
              child: const Text(
                'Dapatkan Rekomendasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Display menu recommendation
            if (_menuRecommendation.isNotEmpty)
              Text(
                _menuRecommendation,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
