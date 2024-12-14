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
        setState(() {
          if (age < 18) {
            _menuRecommendation =
                // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                '• Sarapan: Bubur ayam tanpa MSG, jus apel, telur rebus\n' +
                '• Makan Siang: Nasi putih, ayam kukus tanpa kulit, tumis labu siam\n' +
                '• Snack: Biskuit rendah garam, jus stroberi\n' +
                '• Makan Malam: Sup ayam tanpa garam, sayur bening bayam';
          } else if (age < 60) {
            _menuRecommendation =
                // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                '• Sarapan: Oatmeal tanpa gula, pisang kecil, teh tawar\n' +
                '• Makan Siang: Nasi putih, ikan panggang tanpa garam, tumis kacang panjang\n' +
                '• Snack: Apel kecil, jus pir\n' +
                '• Makan Malam: Bubur kacang hijau tanpa gula, tumis brokoli, ikan kukus';
          } else {
            _menuRecommendation =
                // ignore: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation
                '• Sarapan: Bubur havermut, telur rebus, teh hangat tanpa gula\n' +
                '• Makan Siang: Nasi putih, daging sapi rebus tanpa garam, sayur sop\n' +
                '• Snack: Buah pepaya kecil, jus melon\n' +
                '• Makan Malam: Sup ayam tanpa kulit, tumis labu siam, semangka';
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
            // Input field for age (matching BmiPage style)
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Masukkan Usia',
                hintText: 'Contoh: 25',
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
                fillColor: Colors.white.withOpacity(0.2), // Slight transparency for the background
              ),
            ),
            const SizedBox(height: 16),

            // Input field for weight (matching BmiPage style)
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white), // Set the text color to white
              decoration: InputDecoration(
                labelText: 'Masukkan Berat Badan (kg)',
                hintText: 'Contoh: 60',
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
                fillColor: Colors.white.withOpacity(0.2), // Slight transparency for the background
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _menuRecommendation,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
