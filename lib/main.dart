// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'pbm23',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool cb1 = false;
  bool passwordVisible = true;
  var selected_date = '';

  void tampilkanPopup() {
    showDialog(
      context: context,
      builder: (BuildContext ctx1) {
        return AlertDialog(
          title: Text('Simpan Data'),
          content: Text('Apakah anda yakin akan menyimpan data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                // mensimulasikan tombol kembali diclick
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(onPressed: () {}, child: Text('Konfirm')),
          ],
        );
      },
    );
  }

  ambilTanggal() async {
    var tanggal = await showDatePicker(
      context: context,
      initialDate: DateTime(2023, 04, 04),
      firstDate: DateTime(2023, 4, 2),
      lastDate: DateTime(2023, 4, 5),
    );

    if (tanggal != null) {
      print('tanggal dipilih: $tanggal');
      setState(() {
        selected_date = DateFormat('yyyy-MM-dd').format(tanggal);
      });
    } else {
      print('tanggal bernilai null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pbm23'),
      ),
      body: Column(
        children: [
          Text('Textfield 1'),
          TextField(
            obscureText: passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  print('icon pasword clicked');
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
            onChanged: (String v) {
              print('f1: $v');
            },
          ),
          Text('tf 2'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Angkatan',
            ),
          ),
          SizedBox(height: 30),
          Text(
            'checkbox 1',
            style: TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              Checkbox(
                value: cb1,
                onChanged: (bool? v) {
                  print('checkbox 1: $v');

                  setState(() {
                    cb1 = v ?? false;
                  });
                },
              ),
              Text('Laki-laki'),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: cb1,
                onChanged: (bool? v) {
                  print('checkbox 1: $v');

                  setState(() {
                    cb1 = v ?? false;
                  });
                },
              ),
              Text('Perempuan'),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: ambilTanggal,
                child: Text('Pilih Tanggal'),
              ),
              Text(selected_date),
            ],
          ),
          ElevatedButton(
            onPressed: tampilkanPopup,
            child: Text('Konfirmasi!'),
          ),
        ],
      ),
    );
  }
}
