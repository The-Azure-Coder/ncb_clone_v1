import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
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
        child: SetBckgrdImage(
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
                                  color: Color.fromARGB(255, 1, 95, 195)
                                      .withOpacity(0.9),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(22),
                                    topRight: Radius.circular(22),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          style: TextStyle(color: Colors.white))
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
                                    width: screenSize.width * 0.90,
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

      // print(responseData["data"]["accessToken"]);
      SecureStore.storeToken("jwt-auth", data["accessToken"]);
      Map<String, dynamic> mapUser = data['user'];
      List<dynamic> mapAccounts = data['user']['accounts'];
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
    Loader.hide();
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
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: SizedBox(
                width: 300,
                child: TextFormField(
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _username = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: new TextStyle(
                          color: Color.fromARGB(255, 170, 169, 169)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 170, 169, 169)),
                      ),
                    ),
                    controller: myController,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return "Username field is required";
                      }
                      return null;
                    }),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 14.0,
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: new TextStyle(
                        color: Color.fromARGB(255, 170, 169, 169)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 170, 169, 169)),
                    ),
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
            ),
            const SizedBox(height: 20),
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
                    Text(
                      'Remember Me',
                      style: TextStyle(
                          fontSize: 13, color: Color.fromARGB(255, 2, 85, 187)),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                          color: Color.fromARGB(255, 2, 85, 187)),
                    ))
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 340,
                    height: 39,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          elevation: 0.0,
                          backgroundColor: Color.fromARGB(255, 247, 210, 26)),
                      onPressed: () {
                        if (_formKey.currentState!.validate())
                          setState(() {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            Loader.show(context,
                                progressIndicator: CircularProgressIndicator(
                                  color: Colors.amber,
                                  backgroundColor: Colors.blueGrey,
                                ),
                                themeData: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.fromSwatch()
                                        .copyWith(secondary: Colors.red)),
                                overlayColor: Color(0x99E8EAF6));
                          });
                        Future.delayed(Duration(seconds: 4), (() async {
                          if (await submitLogin() == true) {
                            setState(() {
                              Loader.hide();
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
                              Loader.hide();
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
                      child: Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.black, fontSize: 11),
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
