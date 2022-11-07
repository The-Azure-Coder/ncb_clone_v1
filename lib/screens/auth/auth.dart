import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';
import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'package:ncb_frontend_v1/screens/auth/login_page_utils.dart';
import 'package:ncb_frontend_v1/widgets/custom_form_field.dart';
import 'package:ncb_frontend_v1/screens/auth/login_state_mgmt.dart';
import '../auth/auth_widgets.dart';

String bckgroundImage = 'assets/images/ncb_background.png';

class ParentWidget extends StatefulWidget {
  const ParentWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return LoginStateMgmt(child: AuthScreen());
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var inherited = FormStateInheritedWidget.of(context);
    Screen? _screenState = FormStateInheritedWidget.of(context)?.formState;
    return LoginPage(screenState: _screenState!);

  }
}


