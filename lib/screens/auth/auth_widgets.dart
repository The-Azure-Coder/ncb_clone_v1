import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';
import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'package:ncb_frontend_v1/screens/auth/login_page_utils.dart';
import 'package:ncb_frontend_v1/widgets/custom_form_field.dart';
import 'package:ncb_frontend_v1/screens/auth/login_state_mgmt.dart';
String bckgroundImage = 'assets/images/ncb_background.png';

class LoginPage extends StatefulWidget {
  final Screen screenState;
  const LoginPage({super.key, required this.screenState});

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
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              16, 32, 16, 0),
                                          child: widget.screenState == Screen.login
                                              ? LoginForm()
                                              : RegisterForm()),
                                    ],
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
//--------------------------------------------

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
        _error = error.toString();
        print(_error);
      });
      AlertDialog(
        title: Text("Error"),
        content: Text("$_error"),
        backgroundColor: Colors.black,
      );
      return false;
    }
  }

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool _obscureText = true;
  bool _rememberMe = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void dispose() {
    // usernameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var inherited = FormStateInheritedWidget.of(context);
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
              decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'jdoe7111',
                  ),
              controller: usernameCtrl,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Username field is required";
                }
                return null;
              },
            ),
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
              controller: passwordCtrl,
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
            BtnContainer(
              formActionButtons: <Widget>[
                drawLoginBtn(),
                toggleForm(inherited , Screen.login),
              ],
            ), const SizedBox(height: 20),
          ],
        ));
  }

  Widget drawLoginBtn(){
    return Flexible(
        child: SizedBox(
          width: 330,
          height: 39,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
            ),
            onPressed:() async {
                if (await submitLogin()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
            },
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ));
  }

  git config --global user.email "rackeel13@gmail.com"
  git config --global user.name "cout-Rackeel"


}
//--------------------------------------------

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _trn = "";
  String _phnNumber = "";
  String _password = "";

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  static final usernameCtrl = TextEditingController();
  static final trnCtrl = TextEditingController();
  static final phnNumberCtrl = TextEditingController();
  static final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
     var inherited = FormStateInheritedWidget.of(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: <Widget>[
          Row(
            mainAxisSize:MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Expanded(
                child:   TextFormField(
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'janed@mail.com',
                  labelText: 'Username',
              ),
              controller: usernameCtrl,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Username field is required";
                }
                return null;
              },
            ),
            ),

            SizedBox(width: screenSize.width * 0.09),

             Expanded(
                child:   TextFormField(
              onChanged: (value) {
                setState(() {
                  _trn = value;
                });
              },
              decoration: InputDecoration(
                  hintText: '111-111-111',
                  labelText: 'TRN',
              ),
              controller: usernameCtrl,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "TRN field is required";
                }
                return null;
              },
            ),
            ),



          ]),
          Row(
            children: [
              Expanded(
                child:   TextFormField(
              onChanged: (value) {
                setState(() {
                  _phnNumber = value;
                });
              },
              decoration: InputDecoration(
                  hintText: 'janed@mail.com',
                  labelText: 'Phone Number',
              ),
              controller: usernameCtrl,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Phone number field is required";
                }
                return null;
              },
            ),
            ),
            ],
          ),
          Row(
            children: [
              Expanded(child: 
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
              controller: passwordCtrl,
              validator: (String? val) {
                if (val == null || val.isEmpty) {
                  return "Password field is required";
                }
                return null;
              },
            ),
              ),
              
            ],
          ),
          const SizedBox(height: 20),
          BtnContainer(
            formActionButtons: <Widget>[
              toggleForm(inherited , Screen.register),
            ],
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
//--------------------------------------------

class BtnContainer extends StatelessWidget {
    final List<Widget> formActionButtons;
    const BtnContainer({ Key? key, required this.formActionButtons }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:formActionButtons
      );
    }
  }
Widget toggleForm(provider , Screen formType){
  return Flexible(
      child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 39,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: TextButton(
            onPressed: (){
              if(formType == Screen.login){
                provider?.setToRegister();
              }

              if(formType == Screen.register){
                provider?.setToLogin();
              }

            },
            child: Text(
                formType == Screen.login ? "SIGN UP" : "LOGIN",
                style:
                TextStyle(
                    color:
                    Colors.lightBlue,
                    fontSize: 14)
            ),
          )
      ));
}


