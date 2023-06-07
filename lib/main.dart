// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbm233/home.dart';
import 'package:pbm233/screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mobile Fasilkom',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LandingScreen(),
    );
  }
}

void navigateTo({required BuildContext ctx, required Widget page}) {
  Navigator.of(ctx).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  ));
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool cbLakiLaki = false;
  bool cbPerempuan = false;
  bool passwordVisible = true;
  var selected_date = '';
  var nama_mhs = '';

  var tf1Ctrl = TextEditingController();
  var tf2Ctrl = TextEditingController();

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
            TextButton(
              onPressed: () async {
                print('tf1: ${tf1Ctrl.text}');
                print('tf2: ${tf2Ctrl.text}');

                Navigator.of(context).pop();
                var nilai = await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext ctx2) {
                  return HomePage(
                    nama: tf1Ctrl.text,
                    angkatan: tf2Ctrl.text,
                  );
                }));

                if (nilai != null) {
                  // proses data yg dikembalikan dari halaman homepage
                  print('nilai: $nilai');
                } else {
                  print('tidak ada data yang dikembalikan');
                }
              },
              child: Text('Konfirm'),
            ),
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
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: Text('Textfield 1'),
            ),
            TextField(
              controller: tf1Ctrl,
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
              // onChanged: (String v) {
              //   print('f1: $v');
              //   nama_mhs = v;
              // },
            ),
            Text('tf 2'),
            TextField(
              controller: tf2Ctrl,
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
                  value: cbLakiLaki,
                  onChanged: (bool? v) {
                    print('checkbox 1: $v');
                    setState(() {
                      cbLakiLaki = v ?? false;
                    });
                  },
                ),
                Text('Laki-laki'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: cbPerempuan,
                  onChanged: (bool? v) {
                    print('checkbox 1: $v');
                    setState(() {
                      cbPerempuan = v ?? false;
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
      ),
    );
  }
}
