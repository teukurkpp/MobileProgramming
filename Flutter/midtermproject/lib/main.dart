import 'package:flutter/material.dart';
import 'halaman/halaman_navigasi.dart';

void main() {
  runApp(const CatatanKeuanganApp());
}

class CatatanKeuanganApp extends StatelessWidget {
  const CatatanKeuanganApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catatan Keuangan Anak Kos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HalamanNavigasi(),
    );
  }
}
