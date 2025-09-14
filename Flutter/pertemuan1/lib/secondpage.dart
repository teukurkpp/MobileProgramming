import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String nama;
  final String npm;
  final double ipk;
  const SecondPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.ipk,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Mahasiswa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Nama: $nama"), Text("NPM: $npm"), Text("IPK: $ipk")],
        ),
      ),
    );
  }
}