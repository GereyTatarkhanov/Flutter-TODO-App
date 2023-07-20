import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home_page.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox('my_box');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      );
  }
}
