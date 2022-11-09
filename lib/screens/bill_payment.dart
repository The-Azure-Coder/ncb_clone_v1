import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/utilities/bill_payment_util.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPayment();
}

class _BillPayment extends State<BillPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TextIconBar(title: 'Bill Payment', preferredSize: Size.fromHeight(120.0)),
      body: ListView(children: [
        Form(
          child: Column(
            children: [
              IconDropDown(
                  number: 1,
                  title: 'Bill',
                  subtitle: 'Bill type',
                  child: Column(
                    children: [
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: "Name",
                      //       labelStyle: TextStyle(
                      //           fontSize: 17.0,
                      //           color: Colors.black,
                      //           fontWeight: FontWeight.w500)),
                      // ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixText: '',
                            labelText: "Type of bill",
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  )),
              IconDropDown(
                  number: 2,
                  title: 'Payee Info',
                  subtitle: 'Enter payee info',
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
                            // prefixText: '(876) ',
                            labelText: "bill #",
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
                subtitle: 'Add the Amount',
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixText: 'JMD ',
                      labelText: "\$5000",
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
            child: Text('Make Payment', style: TextStyle(fontSize: 20, color: Colors.black),),
          ),
        )
      ]),
    );
  }
}