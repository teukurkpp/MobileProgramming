import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> beritaList = [
  {
    "judul": "Gaji Cristiano Ronaldo dari Masa ke Masa",
    "deskripsi": "Sejak menembus dunia sepak bola , Cristiano Ronaldo sudah menarik perhatian banyak klub dan sponsor.",
    "gambar": "assets/images/ronaldo.jpg"
  },
  {
    "judul": "Atletico Madrid vs Real Madrid 27 Sept 2025",
    "deskripsi": "Pertandingan Liga Spanyol antara Atletico Madrid vs Real Madrid ini dimainkan di Riyadh Air Metropolitano.",
    "gambar": "assets/images/madrid.jpg"
  },
  {
    "judul": "10 Transfer Chelsea Era Roman Abramovich",
    "deskripsi": "Sejak Roman Abramovich datang, Chelsea dikenal agresif di pasar transfer.",
    "gambar": "assets/images/abramovich.jpg"
  }
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Berita Sepak Bola")),
        body: ListView.builder(
          itemCount: beritaList.length,
          itemBuilder: (context, index) {
            final berita = beritaList[index];
            return ListTile(
              leading: Image.asset(
                berita["gambar"]!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: Text(berita["judul"]!),
              subtitle: Text(berita["deskripsi"]!),
              trailing: const Icon(Icons.bookmark_border),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Mengalihkan ke halaman berita"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}