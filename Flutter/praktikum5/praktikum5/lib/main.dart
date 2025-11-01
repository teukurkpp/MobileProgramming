import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); //=> sama {} sama aja

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Halaman Formulir',
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
  final cAlamat = TextEditingController();

  DateTime? tglLahir; //tanda tanya artinya boleh null
  TimeOfDay? jamBimbingan;

  String get tglLahirLabel => tglLahir == null
      ? 'Pilih Tanggal Lahir' //tanda tanya di sini artinya pengganti if else yang lebih simple
      : '${tglLahir!.day}/${tglLahir!.month}/${tglLahir!.year}';
  String get jamLabel => jamBimbingan == null
      ? 'Pilih Jam Bimbingan'
      : '${jamBimbingan!.hour}:${jamBimbingan!.minute}';

  @override
  void dispose() {
    cName.dispose();
    cNPM.dispose();
    cEmail.dispose();
    cAlamat.dispose();
    super.dispose();
  }

  //future ngasih janji kalau nilai nya pasti ada
  Future<void> _pickDate() async {
    // _pickDate adalah fungtion
    final res = await showDatePicker(
      //async dan await udah sepasang, digunakan untuk sesuatu yg membutuhkan akses cukup berat, klo ga pake nanti bakal lama di proses
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (res != null) setState(() => tglLahir = res);
  }

  Future<void> _pickTime() async {
    final res = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (res != null) setState(() => jamBimbingan = res);
  }

  void _simpan() {
    if (!_formKey.currentState!.validate() ||
        tglLahir == null ||
        jamBimbingan == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Data belum lengkap')));
      return; //ketika melakukan return, fungtion tersebut berenti di sini, tapi kalau false lanjut k bawah
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ringkasan Data'),
        content: Text(
          'Nama: ${cName.text}\nNPM: ${cNPM.text}\nEmail: ${cEmail.text}\nAlamat: ${cAlamat.text}\nTanggalLahir: $tglLahirLabel\nJam Bimbingan: $jamLabel',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Formulir Mahasiswa')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: cName,
              decoration: const InputDecoration(labelText: 'Nama'),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Nama harus diisi' : null,
            ),
            TextFormField(
              controller: cNPM,
              decoration: const InputDecoration(labelText: 'NPM'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value == null || value.isEmpty ? 'NPM harus diisi' : null,
            ),
            TextFormField(
              controller: cEmail,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Email harus diisi';
                final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim());
                return ok ? null : 'Format email salah';
              },
            ),
            TextFormField(
              controller: cAlamat,
              decoration: const InputDecoration(labelText: 'Alamat'),
              maxLines: 3,
              validator: (value) =>
                  value == null || value.isEmpty ? 'Alamat harus diisi' : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _pickDate, child: Text(tglLahirLabel)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _pickTime, child: Text(jamLabel)),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _simpan, child: const Text('Simpan')),
          ],
        ),
      ),
    ),
  );
}