import 'package:flutter/material.dart';
import 'package:register_docs_app/home.dart';
import 'package:register_docs_app/scanner.dart';
import 'package:register_docs_app/registration.dart';
import 'formulaire.dart';

void main() => runApp(TheApp());

class TheApp extends StatelessWidget {
  const TheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/formulaire',
      routes: {
        '/formulaire' : (context) => Login(),
        '/home' : (context) => Home(),
        '/scanner' : (context) => QRScan(),
        '/registration' : (context) => Register()
      },
    );
  }
}
