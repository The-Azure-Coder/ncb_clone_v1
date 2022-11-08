import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ncb_frontend_v1/constants/colors.dart';
import 'package:ncb_frontend_v1/screens/errors/credentialError.dart';
// import 'package:ncb_frontend_v1/constants/colors.dart';
// import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';
// import 'package:ncb_frontend_v1/screens/login.dart';
import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'package:ncb_frontend_v1/utilities/login_page_util.dart';

import 'home_screen/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Stack(children: [
          SetBckgrdImage(
              SafeArea(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  width: screenSize.width,
                                  height: screenSize.height * 0.2,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.blue.shade800.withOpacity(0.8),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text("Activate Your Card | ",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text("Quick Send",
                                            style: TextStyle(
                                              color: Colors.amberAccent,
                                            )),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.currency_exchange,
                                          color: Colors.amberAccent,
                                        ),
                                        Text(" | More...",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ),
                                )),
                            Positioned(
                              bottom: screenSize.height * 0.08,
                              child: IntrinsicHeight(
                                child: ClipPath(
                                  clipper: LoginClip(),
                                  child: Container(
                                      height: double.infinity,
                                      width: screenSize.width * 0.95,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 35.0),
                                        child: LoginForm(),
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              image: images.bckgroundImage),
          loader
              ? Container(
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.259),
                  child: Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 0),
                            )
                          ]),
                      child: Center(
                        child: LoadingAnimationWidget.discreteCircle(
                          // LoadingAnimationwidget that call the
                          color: Colors.green,
                          secondRingColor: Colors.red,
                          thirdRingColor:
                              Colors.amber, // staggeredditwave animation
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          // LoginForm.submitLogin ? Container()
        ]),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";
  String _error = "";

  // @override
  // void dispose() {
  //   submitLogin().dispose();
  // }

  Future<bool> submitLogin() async {
    try {
      String userData = await NetworkHandler.post(
          "/auth/login", {"username": _username, "password": _password});
      Map responseData = jsonDecode(userData);
      print(responseData);
      Map data = responseData["data"];

      print(responseData["data"]["accessToken"]);
      SecureStore.storeToken("jwt-auth", data["accessToken"]);
      Map<String, dynamic> mapUser = data['user'];
      SecureStore.createUser(mapUser);
      return true;
    } catch (error) {
      setState(() {
        // LoginPage.error = !LoginPage.error;
        _error = error.toString();
        print(_error);
      });
      return false;
    }
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  

  bool _obscureText = true;
  bool _rememberMe = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'rackeel',
                ),
                controller: myController,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return "Username field is required";
                  }
                  return null;
                }),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _toggle();
                    },
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility
                          : Icons.visibility_off_rounded,
                      color: Colors.grey,
                    ),
                  )),
              obscureText: _obscureText,
              controller: myController2,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Password field is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        }),
                    Text('Remember Me')
                  ],
                ),
                TextButton(onPressed: () {}, child: Text('Forgot Password?'))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 330,
                    height: 39,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(new FocusNode());
                          PageLoader();
                          // Timer(Duration(seconds: 15), (() {
                          //   PageLoader();
                          //   print("objectTimer");
                          // }));
                          print("object");
                        });
                        Future.delayed(Duration(seconds: 4), (() async {
                          print("object453");
                          if (await submitLogin() == true) {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomePage();
                                  },
                                  
                                ),
                              );
                            });
                          } else {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CredentialError(),
                                ),
                              );
                            });
                          }
                        }));
                      },
                      // if (_LoginFormState._formKey.currentState!.validate()) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => NextPageClass()));
                      // }

                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Flexible(
                    child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 39,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightBlue),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text("SIGN UP",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 14)),
                )),
              ],
            ),
          ],
        ));
  }
}
