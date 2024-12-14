import 'package:flutter/material.dart';

class CaloriesPage extends StatefulWidget {
  const CaloriesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CaloriesPageState createState() => _CaloriesPageState();
}

class _CaloriesPageState extends State<CaloriesPage> {
  final List<Map<String, dynamic>> _foodItems = [
    {'name': 'Roti Tawar Gandum (2 iris)', 'calories': 120, 'fluid': 10, 'selected': false},
    {'name': 'Telur Rebus (1 butir)', 'calories': 68, 'fluid': 0, 'selected': false},
    {'name': 'Buah Apel (1 buah kecil)', 'calories': 77, 'fluid': 120, 'selected': false},
    {'name': 'Teh Tawar Hangat (1 gelas)', 'calories': 0, 'fluid': 200, 'selected': false},
    {'name': 'Nasi Putih (100 g)', 'calories': 175, 'fluid': 0, 'selected': false},
    {'name': 'Ikan Panggang (50 g)', 'calories': 90, 'fluid': 0, 'selected': false},
    {'name': 'Tumis Labu Siam (100 g)', 'calories': 40, 'fluid': 80, 'selected': false},
    {'name': 'Buah Pir (1/2 buah kecil)', 'calories': 50, 'fluid': 90, 'selected': false},
    {'name': 'Biskuit Tanpa Garam (3 keping)', 'calories': 75, 'fluid': 0, 'selected': false},
    {'name': 'Jus Stroberi (100 ml)', 'calories': 40, 'fluid': 100, 'selected': false},
    {'name': 'Ayam Rebus Tanpa Kulit (50 g)', 'calories': 110, 'fluid': 0, 'selected': false},
    {'name': 'Tumis Kacang Panjang (100 g)', 'calories': 50, 'fluid': 70, 'selected': false},
    {'name': 'Buah Semangka (2 potong kecil)', 'calories': 30, 'fluid': 150, 'selected': false},
  ];

  int _totalCalories = 0;
  int _totalFluids = 0;

  void _toggleFoodItem(int index) {
  setState(() {
    _foodItems[index]['selected'] = !_foodItems[index]['selected'];
    if (_foodItems[index]['selected']) {
      _totalCalories += (_foodItems[index]['calories'] as num).toInt();
      _totalFluids += (_foodItems[index]['fluid'] as num).toInt();
    } else {
      _totalCalories -= (_foodItems[index]['calories'] as num).toInt();
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
          'Hitung Kalori',
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
                        '${item['calories']} kcal - ${item['fluid']} ml',
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
              'Total Kalori: $_totalCalories kcal',
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
          ],
        ),
      ),
    );
  }
}
