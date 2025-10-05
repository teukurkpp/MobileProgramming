import 'package:flutter/material.dart';
import '../model/model_transaksi.dart';
import '../widget/ringkasan_item.dart';

class HalamanCatatan extends StatelessWidget {
  final List<ModelTransaksi> transaksiList;

  const HalamanCatatan({super.key, required this.transaksiList});

  @override
  Widget build(BuildContext context) {
    double totalPemasukan = 0;
    double totalPengeluaran = 0;

    for (var transaksi in transaksiList) {
      final nominal = double.tryParse(transaksi.nominal) ?? 0;
      if (transaksi.kategori == 'Pemasukan') {
        totalPemasukan += nominal;
      } else {
        totalPengeluaran += nominal;
      }
    }

    double saldo = totalPemasukan - totalPengeluaran;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ringkasan Keuangan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buatItemRingkasan('Saldo', saldo, Colors.white, FontWeight.bold),
                  buatItemRingkasan('Pemasukan', totalPemasukan, Colors.green[100]!),
                  buatItemRingkasan('Pengeluaran', totalPengeluaran, Colors.red[100]!),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: transaksiList.isEmpty
              ? const Center(
                  child: Text(
                    'Belum ada catatan keuangan',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: transaksiList.length,
                  itemBuilder: (context, index) {
                    final transaksi = transaksiList[index];
                    final isPemasukan = transaksi.kategori == 'Pemasukan';

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: isPemasukan ? Colors.green : Colors.red,
                          child: Icon(
                            isPemasukan ? Icons.arrow_downward : Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          transaksi.judul,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(transaksi.tanggal),
                        trailing: Text(
                          "Rp ${transaksi.nominal}",
                          style: TextStyle(
                            color: isPemasukan ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
