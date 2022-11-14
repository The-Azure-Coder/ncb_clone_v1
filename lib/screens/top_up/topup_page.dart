import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/models/transaction.dart';
import 'package:ncb_frontend_v1/screens/top_up/topup_utilities.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';

import '../../models/account.dart';
import '../../services/network_handler.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  Future<AccountList> account = SecureStore.getAccount();
  final _topUpKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _type = '634d7b782e3978582611904a';
  final _accId = TextEditingController();
  final _receiverName = TextEditingController();
  final _receiverNumber = TextEditingController();
  final _amount = TextEditingController();
  final _description = 'Mobile TopUp to';

  var _accounts = [];
  var userAccount = '';

  void getAccounts() async {
    try {
      setState(() {
        _accounts = account as List;
        print(_accounts);
      });
    } catch (err) {}
  }



  void postTopUpTraction() async {
    try {
      final response = await NetworkHandler.post(
        '/transactions/',
        Transaction.withoutInfo(
            accId: _accId.text,
            type: _type,
            amount: _amount.text,
            description: '${_description} ${_receiverNumber.text}'),
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }




  @override
  void initState() {
    super.initState();
    getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextIconBar(
          title: 'Prepaid Top-Up', preferredSize: Size.fromHeight(120.0)),
      body: ListView(children: [
        Form(
          key: _topUpKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              IconDropDown(
                  number: 1,
                  title: 'From',
                  subtitle: 'Select Account',
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name of Sender';
                          }
                          return null;
                        }),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        controller: _accId,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixText: '# ',
                          labelText: "Account #",
                          labelStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Account Number of Sender';
                          }
                          return null;
                        }),
                      ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.grey.withOpacity(0.5),
                      //             spreadRadius: 1,
                      //             blurRadius: 1.5,
                      //             offset: const Offset(0, 2))
                      //       ]),
                      //   child: DropdownButton(
                      //     isExpanded: true,
                      //     // Initial Value
                      //     value: _accounts.isEmpty ? "empty" : _accounts[0]['_id'],

                      //     // Down Arrow Icon
                      //     icon: const Icon(Icons.keyboard_arrow_down),

                      //     // Array list of items
                      //     items: _accounts.map((list) {
                      //       return DropdownMenuItem(
                      //         onTap: () {
                      //           setState(() {
                      //             userAccount = list["_id"];
                      //             print(userAccount);
                      //           });
                      //         },
                      //         value: list["_id"],
                      //         child: Text(list["accNo"]),
                      //       );
                      //     }).toList(),
                      //     // After selecting the desired option,it will
                      //     // change button value to selected value
                      //     onChanged: (newValue) {
                      //       print(newValue);
                      //       setState(() {
                      //         // dropdownvalue = newValue;
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  )),
              IconDropDown(
                  number: 2,
                  title: 'To',
                  subtitle: 'Select Phone Number',
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _receiverName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter the Receiver's Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        controller: _receiverNumber,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixText: '(876) ',
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter the Receiver's Phone Number";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              IconDropDown(
                number: 3,
                title: 'Amount',
                subtitle: 'Select Top-up Amount',
                child: TextFormField(
                  controller: _amount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixText: 'JMD ',
                    labelText: "Amount",
                    labelStyle: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Amount';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 30, right: 30))),
            onPressed: () {
              if (_topUpKey.currentState!.validate()) {
                postTopUpTraction();
              } else {
                print('Error');
              }
              ;
            },
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        )
      ]),
    );
  }
}
