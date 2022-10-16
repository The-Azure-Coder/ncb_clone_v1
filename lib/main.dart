import 'package:flutter/material.dart';
// import 'package:ncb_frontend_v1/screens/debit_details.dart';
import 'package:ncb_frontend_v1/screens/login.dart';
// import 'package:ncb_frontend_v1/screens/login.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}

