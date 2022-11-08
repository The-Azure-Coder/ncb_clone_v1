import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/constants/colors.dart';

import '../../utilities/login_page_util.dart';
import '../login.dart';

class CredentialError extends StatefulWidget {
  const CredentialError({super.key});

  @override
  State<CredentialError> createState() => _CredentialErrorState();
}

class _CredentialErrorState extends State<CredentialError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        image: DecorationImage(
          image: AssetImage(images.bckgroundImage),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Center(
        child: AlertDialog(
          title: Text(
            "Error",
            style: TextStyle(color: Colors.red),
          ),
          content: Text("Incorrect Credentials, Try Again...."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
              },
              style: TextButton.styleFrom(
                side: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                ),
                backgroundColor: Colors.amber,
                padding: EdgeInsets.all(12),
                elevation: 2.5,
              ),
              child: Text(
                'Try Again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 90.0,
        ),
      ),
    );
  }
}
