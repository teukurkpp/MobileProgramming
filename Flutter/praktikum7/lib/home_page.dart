import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Ini Adalah Halaman Utama'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: 'Data dari Halaman Utama');
              },
              child: Row (children: [
                const Icon(Icons.navigate_next),
                const SizedBox(width: 8),
                const Text('Pindah ke Halaman Kedua')
              ],),
            ),
          ],
        ),
      ),
    );
  }
}