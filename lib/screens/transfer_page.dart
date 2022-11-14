import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/models/user.dart';
import 'package:ncb_frontend_v1/screens/home_screen/home_page.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';

import '../services/network_handler.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
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

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  getUserId() async {
    var currentUser = await SecureStore.getUser();
    setState(() {
      user = currentUser;
      print(user.id);
    });
    getBenficiaries();
    getAccounts();
  }

  List? _beneficaries;
  List? _accounts;
  String account = '';
  String accType = '';
  String userID = '';
  String accNo = '';
  String currency = '';
  String balance = '';
  String transaction = '';
  String error = '';
  String benificary = '';
  String name = '';

  int _benificaryCount = 0;

  String fromAccount = "";
  String toAccount = "";
  num amount = 0;
  String _error = "";

  // @override
  // void dispose() {
  //   submitLogin().dispose();
  // }

  Future<bool> moneyTransfer(
      String fromAccount, String toAccount, num amount) async {
    Map TransferData = jsonDecode(await NetworkHandler.post("/transfers", {
      "fromAccount": fromAccount,
      "toAccount": toAccount,
      "amount": amount
    }));
    if (TransferData["status"] == 'SUCCESS') {
      print("beneficiary created");
      print(TransferData);

      return true;
    }

    setState(() {
      error = TransferData["error"];
    });
    return false;
  }

  void getBenficiaries() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/users/${user.id}');
      final jsonData = jsonDecode(response)['data']['user']['beneficiaries'];
      // print(jsonData);
      setState(() {
        _beneficaries = jsonData;
        benificary = _beneficaries![0]['accId'] as String;
      });
    } catch (err) {
      print(err);
    }
  }

  void getAccounts() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/users/${user.id}');
      final jsonData = jsonDecode(response)['data']['user']['accounts'];
      print(jsonData);
      setState(() {
        _accounts = jsonData;
        account = _accounts![0]['_id'] as String;
      });
    } catch (err) {
      print(err);
    }
  }

  Future<bool> createBenificary(String name, String accNo) async {
    Map benificaryStatus = jsonDecode(await NetworkHandler.post("/users/", {
      "name": name,
      "accNo": accNo,
    }));

    if (benificaryStatus["status"] == 'SUCCESS') {
      print("beneficiary created");
      print(benificaryStatus);

      return true;
    }
    setState(() {
      error = benificaryStatus["error"];
    });
    return false;
  }

  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: Color.fromARGB(255, 3, 88, 157), // Background color

        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      Color.fromARGB(255, 3, 88, 157)), // Background color),

              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close))
        ],
        automaticallyImplyLeading: false,
        title: Text('Transfer Form'),
      ),
      body: _beneficaries == null || _accounts == null
          ? Text('Loading')
          : Container(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Theme(
                    data: ThemeData(
                      colorScheme:
                          ColorScheme.fromSwatch(primarySwatch: Colors.amber)
                              .copyWith(
                        secondary: Colors.yellow,
                      ),
                    ),
                    child: Stepper(
                      type: stepperType,
                      physics: ScrollPhysics(),
                      currentStep: _currentStep,
                      onStepTapped: (step) => tapped(step),
                      onStepContinue: continued,
                      onStepCancel: cancel,
                      steps: <Step>[
                        Step(
                          title: new Text('Select Account'),
                          content: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10),
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
                                    value: account,

                                    // Down Arrow Icon
                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    // Array list of items
                                    items: _accounts!.map((list) {
                                      return DropdownMenuItem(
                                        onTap: () {
                                          setState(() {
                                            account = list["_id"];
                                            print(account);
                                          });
                                        },
                                        value: fromAccount = list["_id"],
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
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: new Text('Beneficiary Information'),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: DropdownButton(
                                  isExpanded: true,
                                  // Initial Value
                                  value: benificary,

                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),

                                  // Array list of items
                                  items: _beneficaries!.map((list) {
                                    return DropdownMenuItem(
                                      onTap: () {
                                        setState(() {
                                          benificary = list["accId"];
                                          print(benificary);
                                        });
                                      },
                                      value: toAccount = list["accId"],
                                      child: Text(list["name"]),
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
                              Container(
                                padding: EdgeInsets.only(left: 180, top: 8),
                                child: ElevatedButton(
                                  child: Text(
                                    'Add Benificary',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 246, 218, 4),
                                  ),
                                  onPressed: () {
                                    showBenificiaryFields();
                                  },
                                ),
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: new Text('Transfer Ammount'),
                          content: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1.5,
                                          offset: const Offset(0, 2))
                                    ]),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      error = "";
                                      amount = num.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Ammount',
                                    border: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          isActive: _currentStep >= 0,
                          state: _currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      margin: EdgeInsets.only(top: 20),
                      width: 30,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                255, 3, 88, 157), // Background color
                          ),
                          onPressed: () async {
                            if (await moneyTransfer(
                                fromAccount, toAccount, amount)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => HomePage())));
                            }
                          },
                          child: Text('Transfer')))
                ],
              ),
            ),
    );
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  void showBenificiaryFields({Map<String, dynamic> beneficiary = const {}}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Add Benificiary'),
            content: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          // initialValue: benificary['name'],
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              name = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Benificary Name',
                          ),
                        )),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          initialValue: beneficiary['accNo'],
                          onChanged: (value) {
                            setState(() {
                              error = "";
                              accNo = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Account No.',
                          ),
                        )),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (await createBenificary(name, accNo)) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Benificary'),
              ),
            ],
          );
        });
  }
}
