import 'package:flutter/material.dart';
import 'package:flutter_tools/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          minWidth: 0,
          height: 0,
          // padding: EdgeInsets.zero, // 可以设置为zero,
          padding: EdgeInsets.symmetric(
            // 也可以根据自己需要设置padding
            horizontal: 15,
            vertical: 8,
          ),
        ),
      ),
      home: CYRoot(),
    );
  }
}
