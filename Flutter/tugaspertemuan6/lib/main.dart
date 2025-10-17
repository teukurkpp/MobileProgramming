import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Formulir Data Mahasiswa',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const FormMahasiswaPage(),
      );
}

class FormMahasiswaPage extends StatefulWidget {
  const FormMahasiswaPage({super.key});
  @override
  State<FormMahasiswaPage> createState() => _FormMahasiswaPageState();
}

class _FormMahasiswaPageState extends State<FormMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final cName = TextEditingController();
  final cNPM = TextEditingController();
  final cEmail = TextEditingController();
  final cNoHP = TextEditingController();
  final cAlamat = TextEditingController();

  String? _gender;

  @override
  void dispose() {
    cName.dispose();
    cNPM.dispose();
    cEmail.dispose();
    cNoHP.dispose();
    cAlamat.dispose();
    super.dispose();
  }

  void _simpan() {
    if (!_formKey.currentState!.validate() || _gender == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Data belum lengkap')));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilPage(
          nama: cName.text,
          npm: cNPM.text,
          email: cEmail.text,
          noHp: cNoHP.text,
          gender: _gender!,
          alamat: cAlamat.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Formulir Data Mahasiswa')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: cName,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Nama harus diisi' : null,
                ),
                TextFormField(
                  controller: cNPM,
                  decoration: const InputDecoration(
                    labelText: 'NPM',
                    prefixIcon: Icon(Icons.badge),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'NPM harus diisi' : null,
                ),
                TextFormField(
                  controller: cEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email harus diisi';
                    if (!v.endsWith('@student.unsika.ac.id')) {
                      return 'Email harus menggunakan @student.unsika.ac.id';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: cNoHP,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Nomor HP harus diisi';
                    if (!RegExp(r'^[0-9]+$').hasMatch(v)) {
                      return 'Nomor HP hanya boleh angka';
                    }
                    if (v.length < 10) {
                      return 'Nomor HP minimal 10 digit';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Jenis Kelamin',
                    prefixIcon: Icon(Icons.wc),
                  ),
                  value: _gender,
                  items: const [
                    DropdownMenuItem(
                        value: 'Laki-laki', child: Text('Laki-laki')),
                    DropdownMenuItem(
                        value: 'Perempuan', child: Text('Perempuan')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Pilih jenis kelamin' : null,
                ),
                TextFormField(
                  controller: cAlamat,
                  decoration: const InputDecoration(
                    labelText: 'Alamat',
                    prefixIcon: Icon(Icons.home),
                  ),
                  maxLines: 3,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Alamat harus diisi'
                      : null,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _simpan,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      );
}

class HasilPage extends StatelessWidget {
  final String nama;
  final String npm;
  final String email;
  final String noHp;
  final String gender;
  final String alamat;

  const HasilPage({
    super.key,
    required this.nama,
    required this.npm,
    required this.email,
    required this.noHp,
    required this.gender,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Hasil Data Mahasiswa')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $nama'),
                  Text('NPM: $npm'),
                  Text('Email: $email'),
                  Text('No. HP: $noHp'),
                  Text('Jenis Kelamin: $gender'),
                  Text('Alamat: $alamat'),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}