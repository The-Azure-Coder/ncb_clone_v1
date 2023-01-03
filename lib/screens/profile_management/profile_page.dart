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
                              width: 50,
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                'Online Profile',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 66, 66, 66)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 0.2,
                        color: Color.fromARGB(255, 80, 80, 80),
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
                                Text(
                                  'Name:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 83, 83)),
                                ),
                                Text('Tyrone Wilson',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 83, 83))),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TRN:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 83, 83)),
                                ),
                                Text(
                                  '132675325',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 83, 83)),
                                )
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
                                Text('Date of Birth:',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 83, 83))),
                                Text('28-12-2001',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 83, 83))),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Gender:',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 83, 83))),
                                  Text('M',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 84, 83, 83)))
                                ],
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
                                Text('Mailing Address:',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 84, 83, 83))),
                                Text('123 Riverdale',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 84, 83, 83)))
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
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EMAIL ADDRESS',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1.0,
                                      color: Color.fromARGB(255, 233, 233, 233),
                                      spreadRadius: 2,
                                      offset: Offset(1, 5)),
                                ]),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.words,
                              initialValue: "JRACKFINN@GMAIL.COM",
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                            spreadRadius: 2,
                                            offset: Offset(1, 5)),
                                      ]),
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    initialValue: "123456789",
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                            height: 30,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Home address',
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                            spreadRadius: 2,
                                            offset: Offset(1, 5)),
                                      ]),
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    // initialValue: "JRACKFINN@GMAIL.COM",
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Enter Home Address',
                                        labelStyle: TextStyle(
                                          fontSize: 15.0,
                                          color: Color.fromARGB(
                                              255, 128, 128, 128),
                                        )),
                                  ),
                                ),
                              ],
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
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 246, 197, 49)),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.only(left: 30, right: 30))),
              onPressed: () {},
              child: Text(
                'Update',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
