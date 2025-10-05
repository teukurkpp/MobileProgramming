import 'package:flutter/material.dart';
import '../model/model_transaksi.dart';
import 'halaman_catatan.dart';
import 'halaman_tambah.dart';

class HalamanNavigasi extends StatefulWidget {
  const HalamanNavigasi({super.key});

  @override
  State<HalamanNavigasi> createState() => _HalamanNavigasiState();
}

class _HalamanNavigasiState extends State<HalamanNavigasi> {
  int _indeksTerpilih = 0;
  final List<ModelTransaksi> _daftarTransaksi = [];

  void _tambahTransaksi(ModelTransaksi transaksi) {
    setState(() {
      _daftarTransaksi.add(transaksi);
      _indeksTerpilih = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      HalamanCatatan(transaksiList: _daftarTransaksi),
      HalamanTambah(onSubmit: _tambahTransaksi),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Keuangan Anak Kos'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: halaman[_indeksTerpilih],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeksTerpilih,
        selectedItemColor: Colors.teal,
        onTap: (indeks) {
          setState(() {
            _indeksTerpilih = indeks;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Catatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Tambah',
          ),
        ],
      ),
    );
  }
}
