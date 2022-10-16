import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/utilities/login_page_util.dart';
String bckgroundImage = 'assets/images/ncb_background.png';
import 'package:ncb_frontend_v1/screens/debit_details.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SetBckgrdImage(
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
                                color: Colors.blue.shade800.withOpacity(0.8),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Text("Activate Your Card | ",
                                        style: TextStyle(color: Colors.white)),
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
                            )
                            ),
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
          image: bckgroundImage),
    );

  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                          // if (_LoginFormState._formKey.currentState!.validate()) {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => NextPageClass()));
                          // }
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    )),
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
