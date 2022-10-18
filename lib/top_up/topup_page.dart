import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/top_up/topup_utilities.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextIconBar(title: 'Prepaid Top-Up'),
      body: ListView(children: [
        Form(
          child: Column(
            children: [
              IconDropDown(
                  number: 1,
                  title: 'From',
                  subtitle: 'Select Account',
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: '# ',
                            labelText: "Account #",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  )),
              IconDropDown(
                  number: 2,
                  title: 'To',
                  subtitle: 'Select Phone Number',
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: '(876) ',
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  )),
              IconDropDown(
                number: 3,
                title: 'Amount',
                subtitle: 'Select Top-up Amount',
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixText: 'JMD ',
                      labelText: "Amount",
                      labelStyle: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber), padding: MaterialStatePropertyAll(EdgeInsets.only(left: 30, right: 30))),
            onPressed: () {},
            child: Text('Submit', style: TextStyle(fontSize: 20, color: Colors.black),),
          ),
        )
      ]),
    );
  }
}
