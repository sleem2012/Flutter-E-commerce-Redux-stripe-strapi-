import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Pages/register_page.dart';

import 'Pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter E-commerce',
      routes: {
        '/login':(BuildContext context)=>LoginPage(),
        '/register':(BuildContext context)=>RegisterPage(),

      },
      theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 18),
          ),
          primaryColor: Colors.cyan[400],
          accentColor: Colors.deepOrange[200]),
      home: RegisterPage(),
    );
  }
}
