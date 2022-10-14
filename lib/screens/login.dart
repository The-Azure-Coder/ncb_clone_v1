import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/debit_details.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _MyloginPage();
}

class _MyloginPage extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: (
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => debitPage()));
        }, child: Text('Go Details'))
      )),
      
    );
  }
}
