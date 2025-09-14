import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Nama Aplikasi: My Flutter App",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Versi: 3.35.2",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Developer: Teuku Raka Pratama Putra",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
