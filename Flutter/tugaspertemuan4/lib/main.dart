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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Data belum lengkap')));
      return;
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ringkasan Data'),
        content: Text(
          'Nama: ${cName.text}\n'
          'NPM: ${cNPM.text}\n'
          'Email: ${cEmail.text}\n'
          'No. HP: ${cNoHP.text}\n'
          'Jenis Kelamin: $_gender\n'
          'Alamat: ${cAlamat.text}',
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
