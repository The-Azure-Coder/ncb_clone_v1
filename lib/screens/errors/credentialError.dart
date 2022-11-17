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
          actionsPadding: EdgeInsets.all(20),
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.gpp_maybe_outlined,
            size: 45,
            color: Colors.redAccent,
          ),
          content: Text(
            'The password or username you entered, might be incorrect.\n\n Please try entering your information again.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                side: BorderSide(
                  color: Colors.black.withOpacity(0.4),
                ),
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                elevation: 2.5,
              ),
              child: Text(
                'Try Again',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
