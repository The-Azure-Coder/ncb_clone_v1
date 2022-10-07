import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: ElevatedButton(child: Text('Home Page'), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));}),
    ));
  }
}
