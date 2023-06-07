// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../main.dart';
import 'detail_materi_screen.dart';

class DaftarMateriScreen extends StatefulWidget {
  const DaftarMateriScreen({super.key});

  @override
  State<DaftarMateriScreen> createState() => _DaftarMateriScreenState();
}

class _DaftarMateriScreenState extends State<DaftarMateriScreen> {
  var deskripsi = <String>[
    'Daftar software yang harus diinstal: Java, Android SDK, Flutter SDK, Git, plugin flutter, android simulator.',
    'Pengenalan bahasa pemrograman Dart yang digunakan oleh flutter: konsep variable, function, fungsi main, class.',
    'Pengenalan struktur project flutter: file yaml, folder lib, folder android, widget MaterialApp (root)',
    'Pengenalan widget-widget penting dan mendasar untuk menyusun tampilan aplikasi mobile menggunakan flutter.',
    'Pengenalan widget-widget penting untuk menata tata-letak komponen UI di flutter.',
    'Pengenalan jenis widget statefull: kegunaan, life-cycle, proses update UI.',
    'Pengenalan teknik pemanfaatan GPS dan Plugin Maps untuk dapat menampilkan peta dan lokasi di aplikasi mobile.',
    'Pengenalan teknik pemanfaatan kamera pada perangkat mobile untuk dapat mengambil gambar melalui aplikasi mobile.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Materi'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        children: [
          buildGridItem(
            color: Colors.green,
            title: 'Kontrak Kuliah dan Instalasi SDK',
            content: deskripsi[0],
          ),
          buildGridItem(
            color: Colors.yellow,
            title: 'Bahasa Pemrograman Dart',
            content: deskripsi[1],
          ),
          buildGridItem(
            color: Colors.amber,
            title: 'Pengenalan Flutter',
            content: deskripsi[2],
          ),
          buildGridItem(
            color: Colors.blue,
            title: 'Widget Dasar',
            content: deskripsi[3],
          ),
          buildGridItem(
            color: Colors.brown,
            title: 'Menata Layout',
            content: deskripsi[4],
          ),
          buildGridItem(
            color: Colors.cyan,
            title: 'Stateful Widget',
            content: deskripsi[5],
          ),
          buildGridItem(
            color: Colors.orange,
            title: 'Peta dan GPS',
            content: deskripsi[6],
          ),
          buildGridItem(
            title: 'Kamera',
            content: deskripsi[7],
          ),
        ],
      ),
    );
  }

  Widget buildGridItem({Color? color, String? title, String? content}) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            ctx: context,
            page: DetailMateriScreen(
              title: title ?? 'Materi x',
              content: content ?? '',
            ));

        // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        //   return DetailMateriScreen(
        //     title: title ?? 'Materi x',
        //     content: content ?? '',
        //   );
        // }));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? Colors.red,
        ),
        alignment: Alignment.center,
        child: Text(
          title ?? 'Materi x',
          // style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
