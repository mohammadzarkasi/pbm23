// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DaftarMateriScreen extends StatefulWidget {
  const DaftarMateriScreen({super.key});

  @override
  State<DaftarMateriScreen> createState() => _DaftarMateriScreenState();
}

class _DaftarMateriScreenState extends State<DaftarMateriScreen> {
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
              color: Colors.green, text: 'Kontrak Kuliah dan Instalasi SDK'),
          buildGridItem(color: Colors.yellow, text: 'Bahasa Pemrograman Dart'),
          buildGridItem(color: Colors.amber, text: 'Pengenalan Flutter'),
          buildGridItem(color: Colors.blue, text: 'Widget Dasar'),
          buildGridItem(color: Colors.brown, text: 'Menata Layout'),
          buildGridItem(color: Colors.cyan, text: 'Stateful Widget'),
          buildGridItem(color: Colors.orange, text: 'Peta dan GPS'),
          buildGridItem(text: 'Kamera'),
        ],
      ),
    );
  }

  Widget buildGridItem({Color? color, String? text}) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color ?? Colors.red,
      ),
      alignment: Alignment.center,
      child: Text(
        text ?? 'Materi x',
        // style: TextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
