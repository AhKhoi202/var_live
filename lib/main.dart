import 'package:flutter/material.dart';
import 'package:vnvar_line/screens/home_screen.dart';

void main() {
  runApp(VNVAR_Live());
}


class VNVAR_Live extends StatelessWidget {
  const VNVAR_Live({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VNVAR Live',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Đặt HomeScreen làm màn hình chính
    );
  }
}
