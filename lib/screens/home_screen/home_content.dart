import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/constants/colors.dart';
import 'package:ncb_frontend_v1/screens/creditCard_details.dart';

import 'home_utilities.dart';

class HomeContents extends StatefulWidget {
  const HomeContents({super.key});

  @override
  State<HomeContents> createState() => _HomeContentsState();
}

class _HomeContentsState extends State<HomeContents> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, left: 8.0, right: 8.0, bottom: 30.0),
        child: ListView(children: [
          Accordion(
              title: "Bank Accounts",
              child: doubleBoxes(screenSize: screenSize)),
          Accordion(
              title: "Credit Cards",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * .07,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(4, 4)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Debit Card?',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.chevron_left_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              label: Text(
                                'Activate it Here',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(4, 4)),
                        ],
                        border: Border.all(
                            color: Color.fromARGB(255, 180, 172, 172)),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Savings',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text('Account Balance')
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '....7742',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'JMD 1314.14',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 20,
                              ),
                              Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AccountDetailsScreen()));
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_outlined,
                                      size: 24,
                                    ),
                                    label: Text(
                                      'Account Details',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
          Accordion(
              title: "Investments",
              child: Column(
                children: [
                  Container(
                    width: screenSize.width,
                    // height: screenSize.height * .07,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(4, 4)),
                        ],
                        border: Border.all(
                            color: Color.fromARGB(255, 180, 172, 172)),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: Text('No Investment accounts present',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700)),
                  )
                ],
              )),
          Accordion(
              title: "Loan",
              child: Column(
                children: [
                  Image.asset(images.logo),
                  Container(
                    width: screenSize.width,
                    // height: screenSize.height * .07,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(4, 4)),
                        ],
                        border: Border.all(
                            color: Color.fromARGB(255, 180, 172, 172)),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: Text(
                      'No Loan accounts present',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    padding: MaterialStatePropertyAll(EdgeInsets.all(15.0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))))),
                child: Text(
                  "Don't see all your Accounts?",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
          )
        ]),
      ),
    );
  }
}
