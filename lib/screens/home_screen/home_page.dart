import 'package:flutter/material.dart';
import 'package:ncb_frontend_v1/constants/colors.dart';
import 'package:ncb_frontend_v1/models/user.dart';
import 'package:ncb_frontend_v1/screens/bill_payment.dart';
import 'package:ncb_frontend_v1/screens/login.dart';
import 'package:ncb_frontend_v1/screens/top_up/topup_page.dart';
import 'package:ncb_frontend_v1/screens/transfer_page.dart';
import 'package:ncb_frontend_v1/services/secure_store_service.dart';
import 'package:ncb_frontend_v1/utilities/login_page_util.dart';
import 'package:ncb_frontend_v1/widgets/nav.dart';
import 'home_content.dart';
import 'home_utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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

  getUserId() async {
    var currentUser = await SecureStore.getUser();
    setState(() {
      user = currentUser;
    });
  }

  void logOut() {
    SecureStore.logout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * .42),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Image.asset(
            images.logo,
            width: 40.0,
          ),
          actions: [
            TextButton(
              onPressed: () {
                logOut();
              },
              child: Text('Log Out',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.black]),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(230.0, 55.0)),
                image: DecorationImage(
                  opacity: 0.8,
                  image: AssetImage(images.homeImage1),
                  fit: BoxFit.cover,
                )),
            height: screenSize.height * .4,

            // child: ClipRRect(
            //   borderRadius:
            //       BorderRadius.vertical(bottom: Radius.elliptical(230.0, 55.0)),
            //       child: Container(

            //       ),
            // ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(screenSize.height),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 200, bottom: 30),
                    child: Text(
                      'Good Morning, ${user.firstName}',
                      style: TextStyle(color: Colors.white, fontSize: 20.7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                            side: MaterialStatePropertyAll(BorderSide(
                                width: 0.0, color: Colors.transparent))),
                        clipBehavior: Clip.none,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransferPage()));
                        },
                        child: roundedContainer(
                            boxColor: Colors.blue,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Arch(
                                      child: Icon(
                                    Icons.payments,
                                    size: 37,
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Transfer',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0)),
                                  ),
                                ])),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                            side: MaterialStatePropertyAll(BorderSide(
                                width: 0.0, color: Colors.transparent))),
                        clipBehavior: Clip.none,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BillPage()));
                        },
                        child: roundedContainer(
                            boxColor: Color(0xFF002A54),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Arch(
                                      child: Icon(Icons
                                          .transfer_within_a_station_outlined)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Bill Pay',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ])),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                            side: MaterialStatePropertyAll(BorderSide(
                                width: 0.0, color: Colors.transparent))),
                        clipBehavior: Clip.none,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TopUp()));
                        },
                        child: roundedContainer(
                            boxColor: Colors.amber,
                            child: Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Arch(
                                        child: Icon(Icons
                                            .transfer_within_a_station_outlined)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Top Up',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ]),
                            )),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
      body: HomeContents(),
    );
  }
}
