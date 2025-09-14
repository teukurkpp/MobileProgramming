import 'package:flutter/material.dart';
import 'models/mahasiswa.dart';

class InputMahasiswaData extends StatefulWidget {
  const InputMahasiswaData({super.key});

  @override
  State<InputMahasiswaData> createState() => _InputMahasiswaDataState();
}

class _InputMahasiswaDataState extends State<InputMahasiswaData> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Data Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
              ),
              TextFormField(
                controller: _umurController,
                decoration: const InputDecoration(labelText: "Umur"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Umur wajib diisi";
                  }
                  if (int.tryParse(value) == null) {
                    return "Umur harus angka";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Alamat wajib diisi" : null,
              ),
              TextFormField(
                controller: _kontakController,
                decoration: const InputDecoration(labelText: "Kontak"),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value == null || value.isEmpty ? "Kontak wajib diisi" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final mhs = Mahasiswa(
                      nama: _namaController.text,
                      umur: int.parse(_umurController.text),
                      alamat: _alamatController.text,
                      kontak: _kontakController.text,
                    );
                    Navigator.pop(context, mhs);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
