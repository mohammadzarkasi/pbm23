// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String nama, angkatan;
  HomePage({
    super.key,
    required this.nama,
    required this.angkatan,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tfNilaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Selamat datang ${widget.nama}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text('Angkatan: ${widget.angkatan}'),
            SizedBox(height: 30),
            Text('Nilai:'),
            TextField(
              controller: tfNilaiCtrl,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                var nilai = tfNilaiCtrl.text;
                Navigator.of(context).pop(nilai);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
