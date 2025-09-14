import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'models/mahasiswa.dart'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Kirim Data ke Second Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SecondPage(nama: "Dzikri", npm: "12345678", ipk: 3.85),
              ),
            );
          },
        ),
      ),
    );
  }
}