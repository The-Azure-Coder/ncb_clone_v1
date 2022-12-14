import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/models/transaction.dart';
import 'package:ncb_frontend_v1/screens/transfer_page.dart';

import '../models/account.dart';

import '../services/network_handler.dart';

class debitPage extends StatefulWidget {
  final String accountDetailId;

  const debitPage({super.key, required this.accountDetailId});

  @override
  State<debitPage> createState() => _MydebitPage();
}

class _MydebitPage extends State<debitPage> {
  Account? accountDetail = Account(
    id: '',
    userID: '',
    accType: '',
    accNo: '',
    currency: '',
    balance: 0,
  );

  // Account accInfo;

  List<Transaction> transactions = [];
  void getAccountList() async {
    final accountID = widget.accountDetailId;
    //Account accInfo;
    try {
      final response =
          await NetworkHandler.get(endpoint: '/accounts/${accountID}');
      final jsonData = jsonDecode(response)['data']['account'];
      final transactionData =
          jsonDecode(response)['data']['account']['transactions'];
      print(transactionData);
      // print(jsonData);
      // print(jsonData['account']['userID']);

      accountDetail = Account(
        id: jsonData['_id'],
        userID: jsonData['userID'],
        accType: jsonData['accType'],
        accNo: jsonData['accNo'],
        currency: jsonData['currency'],
        balance: jsonData['balance'],
      );
      print('Before get AccountDetail');

      if (jsonData["transactions"] != null) {
        List responseData = jsonData["transactions"];

        transactions = responseData.map((transaction) {
          return Transaction.fromJson(transaction);
        }).toList();
      }

      print('After get AccountDetail');

      print(jsonData['userID']);
      print(accountDetail!.userID);

      // print(accInfo.UserID.toString());

      setState(() {
        // accountDetail = accInfo; //Account.fromJson(jsonData);
        accountDetail = new Account.fromJson(jsonData);
        accountDetail?.transactions = transactions;
        // accInfo.UserID = jsonData['account']['userID'];
        // Account.fromJson(jsonData).UserID;

        // accInfo.accNo = Account.fromJson(jsonData).accNo;
      });
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    getAccountList();
    super.initState();
    print(accountDetail?.transactions);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // print(widget.accountDetailId);
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: Card(
                margin: const EdgeInsets.only(top: 20),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('SAVINGS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(accountDetail!.accNo,
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
                                SizedBox(
                                  height: 8,
                                ),
                                Text('JMD ' + accountDetail!.balance.toString(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Available:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Lien:',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 1.0,
                                      )),
                                ),
                                Text('Uncleared:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Text(accountDetail!.balance.toString(),
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
                        )
                      ],
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
                                  'BILL PAY',
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
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: SizedBox(
                        width: screenSize.width / 1.09,
                        height: screenSize.height / 10.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.phone_iphone_outlined,
                                    color: Color.fromARGB(255, 2, 41, 113),
                                  ),
                                  label: Text(
                                    'PREPAID TOP-UP',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(100.0, 50.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    elevation: 10,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.feed,
                                    color: Color.fromARGB(253, 2, 41, 113),
                                  ),
                                  label: Text(
                                    'STATEMENTS',
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.0,
                          width: screenSize.width,
                          color: Color(0xFFFFFF),
                          child: Center(
                            child: SizedBox(
                              width: screenSize.width / 1.13,
                              child: Text('TRANSACTION (JMD)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 20),
                                width: screenSize.width,
                                color: Colors.white10,
                                child: Center(
                                  child: Column(
                                    children: accountDetail!.transactions
                                        .map((transaction) {
                                      print(transaction);
                                      return SizedBox(
                                        width: screenSize.width / 1.13,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(transaction.description,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 68, 67, 67),
                                                  )),
                                              Text(
                                                  "${transaction.closingBalance}",
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 99, 97, 97),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// body: Column(
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             IconButton(
  //                 onPressed: () {},
  //                 icon: const Icon(Icons.arrow_back,
  //                     color: Colors.black, size: 30.0)),
  //             TextButton(
  //                 onPressed: () {},
  //                 child: const Text(
  //                   'Log Out',
  //                   style: TextStyle(color: Colors.black, fontSize: 30.0),
  //                 ))
  //           ]),
  //     ),
  //     Card(
  //       margin: const EdgeInsets.all(7.0),
  //       color: Colors.red,
  //       child: SizedBox(
  //         width: screenSize.width / 1.1,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(children: const [
  //               Text('SAVINGS',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20,
  //                   )),
  //               Text('3054176672',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 10,
  //                     letterSpacing: 2.0,
  //                   ))
  //             ]),
  //             Column(
  //               children: const [
  //                 Text('Account Details',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 10,
  //                       letterSpacing: 2.0,
  //                       wordSpacing: 2.0,
  //                     )),
  //                 Text('JMD 1,516.14',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 10,
  //                       letterSpacing: 2.0,
  //                       wordSpacing: 2.0,
  //                     ))
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     )
  //   ],
  // )
}

