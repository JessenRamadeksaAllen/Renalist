import 'package:flutter/material.dart';

class NutrientsPage extends StatefulWidget {
  const NutrientsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NutrientsPageState createState() => _NutrientsPageState();
}

class _NutrientsPageState extends State<NutrientsPage> {
  final List<Map<String, dynamic>> _foodItems = [
    {'name': 'Roti Tawar Gandum (2 iris)', 'protein': 4, 'potassium': 80, 'sodium': 5, 'phosphorus': 70, 'fluid': 10, 'selected': false},
    {'name': 'Telur Rebus (1 butir)', 'protein': 6, 'potassium': 60, 'sodium': 60, 'phosphorus': 90, 'fluid': 0, 'selected': false},
    {'name': 'Buah Apel (1 buah kecil)', 'protein': 0, 'potassium': 150, 'sodium': 0, 'phosphorus': 10, 'fluid': 120, 'selected': false},
    {'name': 'Teh Tawar Hangat (1 gelas)', 'protein': 0, 'potassium': 10, 'sodium': 0, 'phosphorus': 5, 'fluid': 200, 'selected': false},
    {'name': 'Nasi Putih (100 g)', 'protein': 3, 'potassium': 26, 'sodium': 1, 'phosphorus': 37, 'fluid': 0, 'selected': false},
    {'name': 'Ikan Panggang (50 g)', 'protein': 15, 'potassium': 200, 'sodium': 50, 'phosphorus': 180, 'fluid': 0, 'selected': false},
    {'name': 'Tumis Labu Siam (100 g)', 'protein': 1, 'potassium': 150, 'sodium': 15, 'phosphorus': 40, 'fluid': 80, 'selected': false},
    {'name': 'Buah Pir (1/2 buah kecil)', 'protein': 0, 'potassium': 120, 'sodium': 0, 'phosphorus': 10, 'fluid': 90, 'selected': false},
    {'name': 'Biskuit Tanpa Garam (3 keping)', 'protein': 1, 'potassium': 50, 'sodium': 80, 'phosphorus': 20, 'fluid': 0, 'selected': false},
    {'name': 'Jus Stroberi (100 ml)', 'protein': 0, 'potassium': 90, 'sodium': 5, 'phosphorus': 15, 'fluid': 100, 'selected': false},
    {'name': 'Ayam Rebus Tanpa Kulit (50 g)', 'protein': 20, 'potassium': 250, 'sodium': 60, 'phosphorus': 220, 'fluid': 0, 'selected': false},
    {'name': 'Tumis Kacang Panjang (100 g)', 'protein': 2, 'potassium': 190, 'sodium': 5, 'phosphorus': 40, 'fluid': 70, 'selected': false},
    {'name': 'Buah Semangka (2 potong kecil)', 'protein': 1, 'potassium': 170, 'sodium': 0, 'phosphorus': 10, 'fluid': 150, 'selected': false},
  ];

  int _totalProtein = 0;
  int _totalPotassium = 0;
  int _totalSodium = 0;
  int _totalPhosphorus = 0;
  int _totalFluids = 0;

  // Define maximum daily limits
  final int _maxProtein = 50; // Example max daily protein in grams
  final int _maxPotassium = 3500; // Example max daily potassium in mg
  final int _maxSodium = 2300; // Example max daily sodium in mg
  final int _maxPhosphorus = 1200; // Example max daily phosphorus in mg

  void _toggleFoodItem(int index) {
    setState(() {
      _foodItems[index]['selected'] = !_foodItems[index]['selected'];
      if (_foodItems[index]['selected']) {
        _totalProtein += (_foodItems[index]['protein'] as num).toInt();
        _totalPotassium += (_foodItems[index]['potassium'] as num).toInt();
        _totalSodium += (_foodItems[index]['sodium'] as num).toInt();
        _totalPhosphorus += (_foodItems[index]['phosphorus'] as num).toInt();
        _totalFluids += (_foodItems[index]['fluid'] as num).toInt();
      } else {
        _totalProtein -= (_foodItems[index]['protein'] as num).toInt();
        _totalPotassium -= (_foodItems[index]['potassium'] as num).toInt();
        _totalSodium -= (_foodItems[index]['sodium'] as num).toInt();
        _totalPhosphorus -= (_foodItems[index]['phosphorus'] as num).toInt();
        _totalFluids -= (_foodItems[index]['fluid'] as num).toInt();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3C72),
        title: const Text(
          'Hitung Nutrisi',
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
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  final item = _foodItems[index];
                  return Card(
                    color: item['selected'] ? Colors.greenAccent : Colors.white,
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text(
                        '${item['protein']}g protein - ${item['potassium']}mg potassium - ${item['sodium']}mg sodium - ${item['phosphorus']}mg phosphorus - ${item['fluid']} ml',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: Icon(
                        item['selected'] ? Icons.check_circle : Icons.add_circle_outline,
                        color: item['selected'] ? Colors.green : Colors.grey,
                      ),
                      onTap: () => _toggleFoodItem(index),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Protein: $_totalProtein g',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Kalium: $_totalPotassium mg',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Natrium: $_totalSodium mg',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Fosfor: $_totalPhosphorus mg',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Cairan: $_totalFluids ml',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Batas Maksimal Protein: $_maxProtein g',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Batas Maksimal Kalium: $_maxPotassium mg',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Batas Maksimal Natrium: $_maxSodium mg',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Batas Maksimal Fosfor: $_maxPhosphorus mg',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
