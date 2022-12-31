import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/models/user.dart';
import 'package:ncb_frontend_v1/screens/debit_details.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';

import '../../services/network_handler.dart';

class Arch extends StatelessWidget {
  const Arch({required this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(50, 50), top: Radius.circular(10.0)),
        ),
        width: screenSize.width,
        height: screenSize.height * 0.07,
        child: child,
      ),
    );
  }
}

class roundedContainer extends StatelessWidget {
  const roundedContainer({
    required this.child,
    required this.boxColor,
  });
  final Widget? child;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(10.0)),
      width: screenSize.width * 0.30,
      height: screenSize.height * 0.130,
      child: child,
    );
  }
}

// Accordion

class Accordion extends StatefulWidget {
  const Accordion({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _open = false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: _open ? Colors.blue : Color.fromARGB(255, 158, 164, 193),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _open = !_open;
                });
              },
              child: ListTile(
                title: Text(widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                trailing: Icon(
                  _open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
            ),
            _open
                ? Container(
                    color: Colors.white,
                    width: screenSize.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: widget.child)
                : Container()
          ],
        ),
      ),
    );
  }
}

class doubleBoxes extends StatefulWidget {
  const doubleBoxes({super.key, required this.screenSize});
  final Size screenSize;

  @override
  State<doubleBoxes> createState() => _doubleBoxesState();
}

class _doubleBoxesState extends State<doubleBoxes> {
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

  var _accountList = [];
  String accType = '';
  String userID = '';
  String accNo = '';
  String currency = '';
  String balance = '';
  String transaction = '';
  String error = '';

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
        _accountList = jsonData;
        // account = _accountList![0]['_id'] as String;
      });
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: widget.screenSize.width,
        height: widget.screenSize.height * .07,
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
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ))
          ],
        ),
      ),
      ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: _accountList.length,
          itemBuilder: (context, i) {
            final account = _accountList[i];
            return
                //  _accountList == null
                //     ? Center(
                //         child: Image.asset(
                //           'assets/images/loading_gif.gif',
                //           height: 80,
                //           width: 80,
                //         ),
                //       ):
                Container(
                    width: widget.screenSize.width,
                    // height: screenSize.height * .07,
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
                                '${account['accType']['name']}',
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
                                  '${account['accNo']}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${account['balance']}',
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
                                              builder: (context) => debitPage(
                                                    accountDetailId:
                                                        '${account['_id']}',
                                                  )));
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
                          ),
                        ],
                      ),
                    ));
          }),
    ]);
  }
}
