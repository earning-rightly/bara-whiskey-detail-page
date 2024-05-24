import 'package:flutter/material.dart';

import 'design/themedata.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: whilabelTheme,
      title: 'Flutter Demo',
      home:  DetailPage(),
    );
  }
}


