// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class DetailMateriScreen extends StatelessWidget {
  String title, content;
  DetailMateriScreen({
    super.key,
    this.title = 'title',
    this.content = 'content',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Materi $title'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
