import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(BelajarImage());

class BelajarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Menampilkan Gambar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Menampilkan Gambar'),
        ),
        body: Column(
          children: [
            Image.asset('assets/images/com.jpg', height: 100, width: 3000),
            Image.asset('assets/images/tungtung.jpg', height: 100, width: 3000),
            Image.network(
              'https://tse4.mm.bing.net/th/id/OIP.AUFnEnC0V0E7LOjrkiU33QHaE8?pid=Api&P=0&h=180',
              height: 100,
              width: 3000,
            ),
            
            Image(
              image: CachedNetworkImageProvider(
                  'https://tse2.mm.bing.net/th/id/OIP.oTgMh279D3vH-fp-I7lX_QHaG5?pid=Api&P=0&h=180'),
              height: 100,
              width: 3000,
            ),

            CachedNetworkImage(
              imageUrl:
                  'https://tse1.mm.bing.net/th/id/OIP.MR7NlvtFrkn7nEC9W_fOowHaHa?pid=Api&P=0&h=180',
              height: 100,
              width: 3000,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Text("Koneksi error")
            ),
          ],
        ),
      ),
    );
  }
}
