import 'package:flutter/material.dart';
// import 'package:ncb_frontend_v1/screens/debit_details.dart';
import 'package:ncb_frontend_v1/screens/auth/auth_widgets.dart';
import 'package:ncb_frontend_v1/screens/auth/auth.dart';
// import 'package:ncb_frontend_v1/top_up/topup_page.dart';
// import 'package:ncb_frontend_v1/screens/auth_widgets.dart';
// import 'package:ncb_frontend_v1/screens/register_screen/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParentWidget(),
    );
  }
}
