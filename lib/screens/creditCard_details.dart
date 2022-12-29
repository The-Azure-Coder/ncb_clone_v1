import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
//import 'package:account_details/config/palette.dart';

class AccountDetailsScreen extends StatefulWidget {
  @override
  _AccountDetailsScreenState createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  bool isAccountScreen = true;
  // final Function(String) onSelectionButtonTap;
  // final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var screenSize;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff047adc),
          elevation: 0,
          title: Text(''),
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ))
          ]),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xff047adc),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
          ),

          //Main Contianer
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isAccountScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isAccountScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/2560px-Mastercard-logo.svg.png',
                              height: 40,
                              width: 40,
                            ),
                            Text('3054****6721',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text('Account Balance',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  wordSpacing: 2.0,
                                )),
                            Text('JMD 0.00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  wordSpacing: 2.0,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Statement Balnce:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Minimum Payment Due:',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 1.0,
                                  )),
                            ),
                            Text('Payment Due Date:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text('JMD 1,516.14',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  wordSpacing: 2.0,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('JMD 0.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    letterSpacing: 1.0,
                                    wordSpacing: 2.0,
                                  )),
                            ),
                            Text('Sep 30, 2022',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  letterSpacing: 1.0,
                                  wordSpacing: 2.0,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.5,
                      height: 25,
                    ),
                    const ExpansionTile(
                      title: Text('More Details'),
                      children: <Widget>[
                        ListTile(title: Text('Details Here')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin Palette {
  static var textColor1 = Colors.black;

  static var iconColor = Colors.blue;

  static var textColor2 = Colors.black;

  static var activeColor = Colors.lightBlue;
}
