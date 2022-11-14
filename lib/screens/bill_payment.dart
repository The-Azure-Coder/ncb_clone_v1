import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/models/transaction.dart';
import 'package:ncb_frontend_v1/services/network_handler.dart';
import 'package:ncb_frontend_v1/utilities/bill_payment_util.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPayment();
}

class _BillPayment extends State<BillPayment> {
  Map<String, String> data = {};
  GlobalKey<FormState> Bill_formkey = GlobalKey();
  List<String> Bill_types = ['Insurance', 'Internet', 'Cable', 'Electricity'];

  final _accId = TextEditingController();
  final _type = '634d7b782e3978582611904a';
  final _amount = TextEditingController();
  final _description = 'Bill Payment to';
  final _payee = TextEditingController();
  final _billNumber = TextEditingController();
  final _billType = DropdownEditingController<String>();


  void postBillPayment() async {
    try {
      final response = await NetworkHandler.post('/transaction', Transaction.withoutBalances(accId: _accId.text, amount: _amount.text, type: _type, description: '${_description} ${_type}'));
      print(response);
    } catch (e) {
      print(e); 
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextIconBar(
          title: 'Bill Payment', preferredSize: Size.fromHeight(120.0)),
      body: ListView(children: [
        Form(
          key: Bill_formkey,
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
                      // DropdownButtonFormField(
                      //   value: data['Type'],
                      //   items: Bill_types.map(
                      //       (e) => DropdownMenuItem(child: Text(e))).toList(),
                      //   // validator: (value) {
                      //   //   if
                      //   // },
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     prefixText: '',
                      //     labelText: "Type of bill",
                      //     labelStyle: TextStyle(
                      //         fontSize: 17.0,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w500),
                      //   ),
                      //   onChanged: (value) {
                      //     data ['Type'] = value;
                      //   },
                      // ),
                      TextDropdownFormField(
                        controller: _billType,
                        options: ['Insurance', 'Internet', 'Cable', 'Electricity'],

                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            labelText: "Bill Types"),
                        dropdownHeight: 120,
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
                        controller: _payee,
                        onSaved: (value) {
                          data['name'] = value ?? '';
                        },
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
                        controller: _billNumber,
                        onSaved: (value) {
                          data['name'] = value ?? '';
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Please enter a Bill Number";
                          } else if (!RegExp(r'/^[\d]{12}$/gm')
                              .hasMatch(value)) {
                            return 'Bill Number must be all digits';
                          } else
                            return null;
                        },
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
                  controller: _amount,
                  onSaved: (value) {
                    data['name'] = value ?? '';
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please enter the Bill Amount";
                    } else if (!RegExp(r'/^$[\d]+$/gm').hasMatch(value)) {
                      return 'Bill must be all digits and have a  dollar sign infront';
                    } else
                      return null;
                  },
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
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 30, right: 30))),
            // onPressed: () {
            //   if (Bill_formkey.currentState!.validate()) {
            //     Bill_formkey.currentState!.save();
            //     postBillPayment();
            //     // try {
            //     //   NetworkHandler.post('/transactions', data);
            //     //   print(data);
            //     // } catch (e) {
            //     //   print(e);
            //     // }
            //   }
            // },
            onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('${_accId} ${_billType.value} ${_amount.text} ${_description} ${_type}'),
              );
            },
          );
        },
            child: Text(
              'Make Payment',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        )
      ]),
    );
  }
}
