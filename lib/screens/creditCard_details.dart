import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/transfer_page.dart';
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
    var screenSize = MediaQuery.of(context).size;
    // print(widget.accountDetailId);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(270),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ))
            ],
            flexibleSpace: Container(
              height: screenSize.height * 0.25,
              color: Colors.blueAccent,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                child: Card(
                  margin: const EdgeInsets.only(top: 0),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    width: screenSize.width / 1.1,
                    height: screenSize.height / 3.8,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Text('Available Balance',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1.0,
                                            wordSpacing: 2.0,
                                          )),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text('JMD 0.000 ',
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
                                color: Colors.grey,
                                thickness: 0.5,
                                height: 23,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Statement Balance:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1.0,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
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
                                      Text('20000',
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
                              const ExpansionTile(
                                title: Text('More Details'),
                                children: <Widget>[
                                  ListTile(title: Text('Details Here')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width / 1.09,
                      height: screenSize.height / 9.5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TransferPage()),
                                  );
                                },
                                icon: Icon(
                                  Icons.credit_card,
                                  color: Color.fromARGB(255, 2, 41, 113),
                                ),
                                label: Text(
                                  'TRANSFER',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(160.0, 50.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  elevation: 10,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => const ()),
                                  // );
                                },
                                icon: Icon(
                                  Icons.receipt,
                                  color: Color.fromARGB(255, 2, 41, 113),
                                ),
                                label: Text(
                                  'PAY THIS CC BILL',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(140.0, 50.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  elevation: 10,
                                ),
                              ),
                            ]),
                      ),
                    ),

                    //     Column(
                    //       children: [
                    //         Container(
                    //             padding: EdgeInsets.only(top: 20),
                    //             width: screenSize.width,
                    //             color: Colors.white10,
                    //             child: Center(
                    //               child: Column(
                    //                 children: accountDetail!.transactions
                    //                     .map((transaction) {
                    //                   print(transaction);
                    //                   return SizedBox(
                    //                     width: screenSize.width / 1.13,
                    //                     child: Container(
                    //                       padding: EdgeInsets.all(8),
                    //                       child: Row(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Text(transaction.description,
                    //                               style: TextStyle(
                    //                                 fontWeight: FontWeight.bold,
                    //                                 color: Color.fromARGB(
                    //                                     255, 68, 67, 67),
                    //                               )),
                    //                           Text(
                    //                               "${transaction.closingBalance}",
                    //                               style: TextStyle(
                    //                                 color: Color.fromARGB(
                    //                                     255, 99, 97, 97),
                    //                               )),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   );
                    //                 }).toList(),
                    //               ),
                    //             )),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
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
