import 'package:fake_store/constance.dart';
import 'package:fake_store/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store Project',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
