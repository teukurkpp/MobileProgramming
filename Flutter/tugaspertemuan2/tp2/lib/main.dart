import 'package:flutter/material.dart';
import 'models/mahasiswa.dart';
import 'input_mahasiswa_data.dart';
import 'profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Mahasiswa? _mahasiswa;

  Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri url = Uri.parse("tel:$phoneNumber");

  try {
    await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication, 
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Gagal membuka aplikasi telepon: $e")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text("Pergi ke Profile Page"),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputMahasiswaData(),
                  ),
                );
                if (result != null && result is Mahasiswa) {
                  setState(() {
                    _mahasiswa = result;
                  });
                }
              },
              child: const Text("Input Data Mahasiswa"),
            ),

            const SizedBox(height: 20),

            if (_mahasiswa != null) ...[
              Text("Nama: ${_mahasiswa!.nama}"),
              Text("Umur: ${_mahasiswa!.umur}"),
              Text("Alamat: ${_mahasiswa!.alamat}"),
              Text("Kontak: ${_mahasiswa!.kontak}"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _makePhoneCall(_mahasiswa!.kontak);
                },
                child: const Text("Call"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
