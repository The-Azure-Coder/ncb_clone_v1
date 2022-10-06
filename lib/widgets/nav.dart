import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color(0xff047adc),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
                height: 100,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/nav_logo.png'),
                      ),
                      color: Colors.white,
                    ),
                    child: Text("Hello"))),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: const Color(0xff047adc),

              textColor: Colors.white,
              title: const Text("Transfer"),
              leading: const Icon(Icons.payments),
              //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Make Transfer"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Add NCB Beneficatory"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Add Other Bank Beneficatory"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Edit/Delete Beneficary"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              textColor: Colors.white,
              title: const Text("Bill Payment"),
              leading:
                  const Icon(Icons.credit_score), //add icon //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Pay Bill"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Add Payee"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Edit/Delete Payee"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: const Color(0xff047adc),

              textColor: Colors.white,
              title: const Text("PrePaid Top-Up"),
              leading: const Icon(Icons.send_to_mobile),
              //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Send Top-Up"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Add Recipient"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Edit/Delete Recipients"),
                  onTap: () {
                    //action on press
                  },
                )
              ],
            ),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: const Color(0xff047adc),

              textColor: Colors.white,
              title: const Text("Account Management"),
              leading: const Icon(Icons.account_circle),
              //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("My Profile"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Manage My Cards"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Activate New Debit/Credit Card"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("View Statements"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Delete Online Profile"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: const Color(0xff047adc),

              textColor: Colors.white,
              title: const Text("Support"),
              leading: const Icon(Icons.contact_support),
              //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Provide Feedback"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("FAQ"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Rate the App"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Contact Customer Care"),
                  onTap: () {
                    //action on press
                  },
                ), //more child menu
              ],
            ),
            const ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: Color(0xff047adc),

              textColor: Colors.white,
              title: Text("Notifications"),
              leading: Icon(Icons.notifications_none),
              trailing: Icon(
                Icons.send_to_mobile,
                size: 0,
              ),
              //children padding
              children: [],
            ),
            const ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: Color(0xff047adc),

              textColor: Colors.white,
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              trailing: Icon(
                Icons.send_to_mobile,
                size: 0,
              ),
              //children padding
              children: [],
            ),
            ExpansionTile(
              iconColor: Colors.white,
              collapsedTextColor: Colors.white,
              collapsedIconColor: Colors.white,
              collapsedBackgroundColor: const Color(0xff047adc),

              textColor: Colors.white,
              title: const Text("Money Toolbox"),
              leading: const Icon(Icons.settings_backup_restore),
              //children padding
              children: [
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Apply For A Loan Online"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("ABM Locator"),
                  onTap: () {
                    //action on press
                  },
                ),
                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Currency Converter"),
                  onTap: () {
                    //action on press
                  },
                ),

                ListTile(
                  shape: const Border(
                    bottom: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 65, bottom: 12, top: 12),
                  textColor: Colors.white,
                  tileColor: const Color(0xff0010a2),
                  title: const Text("Car Loan Calculator"),
                  onTap: () {
                    //action on press
                  },
                ),

                //more child menu
              ],
            ),
          ],
        ));
  }
}
