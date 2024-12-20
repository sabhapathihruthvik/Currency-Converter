import 'package:currency_converter/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Open Exchange App',
        theme: ThemeData(
          fontFamily: 'DMSans',
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
