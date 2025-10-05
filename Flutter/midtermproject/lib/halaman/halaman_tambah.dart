import 'package:flutter/material.dart';
import '../model/model_transaksi.dart';

class HalamanTambah extends StatefulWidget {
  final Function(ModelTransaksi) onSubmit;

  const HalamanTambah({super.key, required this.onSubmit});

  @override
  State<HalamanTambah> createState() => _HalamanTambahState();
}

class _HalamanTambahState extends State<HalamanTambah> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  String? _kategori;

  void _simpanForm() {
    if (_formKey.currentState!.validate()) {
      final transaksi = ModelTransaksi(
        judul: _judulController.text,
        nominal: _nominalController.text,
        kategori: _kategori!,
        tanggal: "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
      );

      widget.onSubmit(transaksi);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Transaksi berhasil ditambahkan!'),
          backgroundColor: Colors.teal,
        ),
      );

      _judulController.clear();
      _nominalController.clear();
      setState(() {
        _kategori = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset('assets/images/money.png', height: 120),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _judulController,
                  decoration: const InputDecoration(
                    labelText: 'Judul Transaksi',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Judul tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Nominal (Rp)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Nominal wajib diisi';
                    if (int.tryParse(value) == null) {
                      return 'Nominal harus berupa angka';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                  value: _kategori,
                  items: const [
                    DropdownMenuItem(value: 'Pemasukan', child: Text('Pemasukan')),
                    DropdownMenuItem(value: 'Pengeluaran', child: Text('Pengeluaran')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _kategori = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Pilih kategori terlebih dahulu' : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _simpanForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Transaksi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
