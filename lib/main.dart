import 'package:flutter/material.dart';
import 'package:list_grid_ex/detail_page.dart';
import 'package:list_grid_ex/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage()
      },
      debugShowCheckedModeBanner: false,
      title: 'Marseille',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
