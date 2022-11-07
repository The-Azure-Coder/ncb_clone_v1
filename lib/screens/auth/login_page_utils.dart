import 'package:flutter/material.dart';


enum Screen { login, register }

class LoginClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(60, 0);
    path.lineTo(90, 30);
    path.lineTo(size.width - 10, 30);
    path.arcToPoint(Offset(size.width, 40), radius: const Radius.circular(10));
    path.lineTo(size.width, size.height - 10);
    path.arcToPoint(Offset(size.width - 10, size.height),
        radius: const Radius.circular(10));
    path.lineTo(10, size.height);
    path.arcToPoint(Offset(0, size.height - 10),
        radius: const Radius.circular(10));
    path.lineTo(0, 40);
    path.arcToPoint(const Offset(10, 30), radius: const Radius.circular(10));
    path.lineTo(30, 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      this != oldClipper;
}

class SetBckgrdImage extends StatelessWidget {
  final String? image;
  final Widget app;

  SetBckgrdImage(this.app, {String? this.image});

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image!), fit: BoxFit.fitHeight)),
      child: app,
    );
  }
}
