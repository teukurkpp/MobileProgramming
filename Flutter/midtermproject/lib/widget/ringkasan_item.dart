import 'package:flutter/material.dart';

Widget buatItemRingkasan(String label, double nilai, Color warna, [FontWeight? tebal]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      const SizedBox(height: 4),
      Text(
        "Rp ${nilai.toStringAsFixed(0)}",
        style: TextStyle(
          color: warna,
          fontWeight: tebal ?? FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ],
  );
}
