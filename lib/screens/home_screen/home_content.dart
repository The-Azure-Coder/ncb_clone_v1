import 'package:flutter/material.dart';

import 'home_utilities.dart';

// HomeContent
class HomeContents extends StatelessWidget {
  const HomeContents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 30.0),
      child: ListView(children: [
        Accordion(
            title: "Bank Accounts",
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.amber),
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )),
        Accordion(
            title: "title",
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
                )
              ],
            )),
        Accordion(
            title: "title",
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
                )
              ],
            )),
        Accordion(
            title: "title",
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  width: 100.0,
                  height: 100.0,
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
    );
  }
}
