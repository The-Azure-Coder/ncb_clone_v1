import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
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
                            labelText: 'Benificiary Name',
                            contentPadding: const EdgeInsets.only(left: 15),
                          ),
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
                            labelText: 'Account No.',
                            contentPadding: const EdgeInsets.only(left: 15),
                          ),
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
                            labelText: 'Ammount',
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
}
