import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _MyloginPage();
}

class _MyloginPage extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: (Text('login works'))),
    );
  }
}
