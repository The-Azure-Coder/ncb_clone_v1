import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';
import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'package:ncb_frontend_v1/utilities/bill_payment_util.dart';

import '../models/user.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  User user = User(
      id: '',
      firstName: '',
      lastName: '',
      email: '',
      password: '',
      cellPhone: '',
      username: '',
      idType: '',
      trn: '',
      idNumber: '',
      ExpDate: '');

  List? _accounts;
  String account = '';
  String accountid = '';
  String transactionType = '';
  // String Type = '';
  String error = "";
  String description = "";
  num amount = 0;

  String dropdownvalue = 'Item 1';

  List<dynamic> transactionCat = [
    {
      '_id': '634d7b882e3978582611904a',
      'name': 'Credit',
    },
    {'_id': '634d7b782e3978582611904b', 'name': 'Debit'},
  ];

  getUserId() async {
    var currentUser = await SecureStore.getUser();
    setState(() {
      user = currentUser;
      print(user.id);
    });

    getAccounts();
  }

  void getAccounts() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/users/${user.id}');
      final jsonData = jsonDecode(response)['data']['user']['accounts'];
      print(jsonData);
      setState(() {
        _accounts = jsonData;
        accountid = _accounts![0]['_id'] as String;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<bool> payBill(
    String accountid,
    String transactionType,
    num amount,
    String description,
  ) async {
    Map transactionData =
        jsonDecode(await NetworkHandler.post("/transactions", {
      "accountId": accountid,
      "transactionType": transactionType,
      "amount": amount,
      "description": description
    }));
    print(transactionData);
    if (transactionData["status"] == 'SUCCESS') {
      print("beneficiary created");
      print(transactionData);

      return true;
    }

    setState(() {
      error = transactionData['data']['error'];
      ;
      print(error);
    });
    return false;
  }

  void initState() {
    super.initState();

    getUserId();
    transactionType = transactionCat[0]['_id'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextIconBar(
          title: 'Bill Payment', preferredSize: Size.fromHeight(120.0)),
      body: _accounts == null
          ? Text('Loading')
          : Container(
              child: ListView(children: [
                Form(
                  child: Column(
                    children: [
                      IconDropDown(
                          number: 1,
                          title: 'Select Account',
                          subtitle: 'Account Deatils',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Please Select An Account',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 76, 77, 77),
                                        fontSize: 16),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    // Initial Value
                                    value: accountid,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: _accounts!.map((list) {
                                      return DropdownMenuItem(
                                        onTap: () {
                                          setState(() {
                                            accountid = list["_id"];
                                            // account = list["_id"];
                                            print('SINGLE $accountid');
                                            print(
                                                'LIST ${_accounts!.map((e) => e['_id']).toList()}');
                                          });
                                        },
                                        value: list['_id'],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(list["accType"]["name"]),
                                            Text(list["accNo"]),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (newValue) {
                                      print(newValue);
                                      setState(() {
                                        // dropdownvalue = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                      IconDropDown(
                          number: 2,
                          title: 'Bill Description',
                          subtitle: 'Enter Transaction Description ',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  setState(() {
                                    error = "";
                                    description = value;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Description",
                                    labelStyle: TextStyle(
                                      fontSize: 17.0,
                                      color: Color.fromARGB(255, 82, 81, 81),
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    'Select Account Type',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 76, 77, 77),
                                        fontSize: 16),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    // Initial Value
                                    value: transactionType,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: transactionCat.map((list) {
                                      return DropdownMenuItem(
                                        onTap: () {
                                          setState(() {
                                            transactionType = list["_id"];
                                            print('SINGLE $transactionType');
                                            print(
                                                'LIST ${transactionCat.map((e) => e['_id']).toList()}');
                                          });
                                        },
                                        value: list["_id"],
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(list["name"]),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (newValue) {
                                      print(newValue);
                                      setState(() {
                                        // dropdownvalue = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                      IconDropDown(
                        number: 3,
                        title: 'Amount',
                        subtitle: 'Add the Amount',
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              amount = num.parse(value);
                            });
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixText: 'JMD ',
                              labelText: "\$5000",
                              labelStyle: TextStyle(
                                  fontSize: 17.0,
                                  color: Color.fromARGB(255, 163, 162, 162),
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(left: 30, right: 30))),
                    onPressed: () async {
                      var result = await payBill(
                          accountid, transactionType, amount, description);
                      // if (result) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomePage())));
                      // }
                    },
                    child: Text(
                      'Make Payment',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                )
              ]),
            ),
    );
  }
}
