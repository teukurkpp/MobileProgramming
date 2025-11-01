import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third Page')),
      body: const Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Ini Adalah Halaman Ketiga')],
        ),
      ),
    );
  }
}