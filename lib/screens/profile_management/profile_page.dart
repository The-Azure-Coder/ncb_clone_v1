import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/constants/colors.dart';
import 'package:ncb_frontend_v1/screens/top_up/topup_utilities.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              TextIconBar(
                title: 'Profile Management',
                preferredSize: Size.fromHeight(0),
              ),
              Center(
                child: Container(
                  height: 230,
                  width: 350,
                  margin: EdgeInsets.only(top: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Row(
                          children: [
                            Image.asset(
                              images.logo,
                              width: 60,
                              height: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                'Online Profile',
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 8,
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name:'),
                                Text('Tyrone Wilson'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('TRN:'),
                                Text('132675325'),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date of Birth:'),
                                Text('28-12-2001'),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text('Gender:'), Text('M')],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mailing Address:'),
                                Text('123 Riverdale')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 91, 91, 91)
                              .withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Please Select a field you want to edit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20,
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        initialValue: "JRACKFINN@GMAIL.COM",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        width: 20,
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              initialValue: "123456789",
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 30,
                          ),
                          Expanded(
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              // initialValue: "JRACKFINN@GMAIL.COM",
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Home Number',
                                  labelStyle: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.only(left: 30, right: 30))),
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
