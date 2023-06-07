// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../main.dart';
import 'daftar_materi_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: double.infinity, height: 50),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 30),
            Text('Di'),
            SizedBox(height: 30),
            Text(
              'PBM 2023',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'asset/img/logo-unej2.png',
                  width: 150,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  navigateTo(ctx: context, page: DaftarMateriScreen());
                  // Navigator.of(context).push(PageRouteBuilder(
                  //   pageBuilder: (context, animation, secondaryAnimation) {
                  //     return DaftarMateriScreen();
                  //   },
                  //   transitionsBuilder:
                  //       (context, animation, secondaryAnimation, child) {
                  //     const begin = Offset(1.0, 0.0);
                  //     const end = Offset.zero;
                  //     const curve = Curves.ease;

                  //     var tween = Tween(begin: begin, end: end)
                  //         .chain(CurveTween(curve: curve));

                  //     return SlideTransition(
                  //       position: animation.drive(tween),
                  //       child: child,
                  //     );
                  //   },
                  // ));

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) {
                  //       return DaftarMateriScreen();
                  //     },
                  //     settings: RouteSettings(),
                  //   ),
                  // );

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(builder: (ctx) {
                  //     return DaftarMateriScreen();
                  //   }),
                  //   (route) => false,
                  // );
                },
                child: Text('Lanjut'),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
