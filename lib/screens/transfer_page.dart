import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/network_handler.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  var _benificairies = [];
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

  void getBenificiaries() async {
    try {
      final response = await NetworkHandler.get(endpoint: '/beneficiaries');
      final jsonData = jsonDecode(response)['data'];
      print(jsonData);

      setState(() {
        _benificairies = jsonData;
        // _benificaryCount = jsonData.length;
      });
    } catch (err) {}
  }

  Future<bool> createBenificary(String name, String accNo) async {
    Map benificaryStatus =
        jsonDecode(await NetworkHandler.post("/beneficiaries", {
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
    getBenificiaries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close))
        ],
        automaticallyImplyLeading: false,
        title: Text('Transfer Form'),
      ),
      body: Container(
        child: ListView(
          children: [
            Expanded(
                child: Stepper(
              type: stepperType,
              physics: ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: new Text('Account Details'),
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
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintText: 'Name',
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
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
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintText: 'Account Number',
                              border: InputBorder.none),
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
                          value: _benificairies[0]['_id'],

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: _benificairies.map((list) {
                            return DropdownMenuItem(
                              onTap: () {
                                setState(() {
                                  benificary = list["_id"];
                                  print(benificary);
                                });
                              },
                              value: list["_id"],
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
                            backgroundColor: Color.fromARGB(255, 246, 218, 4),
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
                          decoration: InputDecoration(
                            labelText: 'Amount',
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 15),
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
            ))
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
