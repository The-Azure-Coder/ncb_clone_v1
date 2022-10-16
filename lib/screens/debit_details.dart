import 'package:flutter/material.dart';

class debitPage extends StatefulWidget {
  const debitPage({super.key});

  @override
  State<debitPage> createState() => _MydebitPage();
}

class _MydebitPage extends State<debitPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(270),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ))
            ],
            flexibleSpace: Container(
              height: screenSize.height * 0.25,
              color: Colors.blueAccent,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Card(
                margin: const EdgeInsets.only(top: 30),
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                  width: screenSize.width / 1.1,
                  height: screenSize.height / 3.8,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('SAVINGS',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    )),
                                Text('3054176672',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Account Balance',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                      wordSpacing: 2.0,
                                    )),
                                Text('JMD 1,000,516.14',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                      wordSpacing: 2.0,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                      color: Colors.black,
                      thickness: 0.7,
                      height: 23,
                    ),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Available',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Lien',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 1.0,
                                      )),
                                ),
                                Text('Uncleared',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                Text('JMD 1,516.14',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                      wordSpacing: 2.0,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('JMD 0.00',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 1.0,
                                        wordSpacing: 2.0,
                                      )),
                                ),
                                Text('JMD 0.00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      letterSpacing: 1.0,
                                      wordSpacing: 2.0,
                                    )),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),

                    
                  ),
                ),
              ),
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: screenSize.width / 1.09,
            height: screenSize.height / 9.5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.credit_card,
                        color: Color.fromARGB(255, 2, 41, 113),
                      ),
                      label: Text(
                        'TRANSFER',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(160.0, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        elevation: 10,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.receipt,
                        color: Color.fromARGB(255, 2, 41, 113),
                      ),
                      label: Text(
                        'BILL PAY',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(140.0, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        elevation: 10,
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            width: screenSize.width / 1.09,
            height: screenSize.height / 10.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.phone_iphone_outlined,
                        color: Color.fromARGB(255, 2, 41, 113),
                      ),
                      label: Text(
                        'PREPAID TOP-UP',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(100.0, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        elevation: 10,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.feed,
                        color: Color.fromARGB(253, 2, 41, 113),
                      ),
                      label: Text(
                        'STATEMENTS',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(140.0, 50.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        elevation: 10,
                      ),
                    ),
                  ]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                width: screenSize.width,
                color: Color(0xFFFFFF),
                child: Center(
                  child: SizedBox(
                    width: screenSize.width / 1.13,
                    child: Text('TRANSACTION (JMD)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: screenSize.width,
                color: Color.fromARGB(207, 222, 241, 255),
                child: Center(
                  child: SizedBox(
                    width: screenSize.width / 1.13,
                    child: Text('Monday August 22,2022',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        )),
                  ),
                ),
              ),
              Container(
                  height: 50.0,
                  width: screenSize.width,
                  color: Colors.white10,
                  child: Center(
                    child: SizedBox(
                      width: screenSize.width / 1.13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('NCB ABM, Spanish Town, St.Catherine',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                          Text('-\$6790',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

// body: Column(
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             IconButton(
  //                 onPressed: () {},
  //                 icon: const Icon(Icons.arrow_back,
  //                     color: Colors.black, size: 30.0)),
  //             TextButton(
  //                 onPressed: () {},
  //                 child: const Text(
  //                   'Log Out',
  //                   style: TextStyle(color: Colors.black, fontSize: 30.0),
  //                 ))
  //           ]),
  //     ),
  //     Card(
  //       margin: const EdgeInsets.all(7.0),
  //       color: Colors.red,
  //       child: SizedBox(
  //         width: screenSize.width / 1.1,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(children: const [
  //               Text('SAVINGS',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20,
  //                   )),
  //               Text('3054176672',
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 10,
  //                     letterSpacing: 2.0,
  //                   ))
  //             ]),
  //             Column(
  //               children: const [
  //                 Text('Account Details',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 10,
  //                       letterSpacing: 2.0,
  //                       wordSpacing: 2.0,
  //                     )),
  //                 Text('JMD 1,516.14',
  //                     style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 10,
  //                       letterSpacing: 2.0,
  //                       wordSpacing: 2.0,
  //                     ))
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     )
  //   ],
  // )
}
