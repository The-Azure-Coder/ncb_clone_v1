import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/login_screen/login_page_utils.dart';


class LoginStateMgmt extends StatefulWidget {
  final Widget child;
  const LoginStateMgmt({ 
    Key? key,
    required this.child
    }) : super(key: key);


  @override
  _LoginStateMgmtState createState() => _LoginStateMgmtState();
}

class _LoginStateMgmtState extends State<LoginStateMgmt> {
     Screen formState = Screen.login;

     void setToLogin(){
      setState(() => formState = Screen.login);
     }

     void setToRegister(){
      setState(() => formState = Screen.register);
     }

  @override
  Widget build(BuildContext context) => FormStateInheritedWidget(
    formState: formState,
    child: widget.child,
    stateWidget : this
    );
}


class FormStateInheritedWidget extends InheritedWidget {
  final Screen formState;
  final _LoginStateMgmtState stateWidget;

  const FormStateInheritedWidget({
    Key? key,
    required Widget child,
    required Screen this.formState,
    required _LoginStateMgmtState this.stateWidget
  }):super(key:key , child: child);


  static _LoginStateMgmtState? of(BuildContext context) => context
  .dependOnInheritedWidgetOfExactType<FormStateInheritedWidget>()
  ?.stateWidget;

  @override
  bool updateShouldNotify(FormStateInheritedWidget oldWidget) =>
    oldWidget.formState != formState;
  

}