import 'package:flutter/material.dart';

class NutrisiPage extends StatelessWidget {
  const NutrisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Kebutuhan Nutrisi'),
      ),
      body: Center(
        child: Text(
          'Halaman Hitung Kebutuhan Nutrisi dalam pengembangan',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
