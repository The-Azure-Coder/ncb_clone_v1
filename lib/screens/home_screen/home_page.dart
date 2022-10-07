import 'package:flutter/material.dart';
import 'home_utilities.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(310),
        child: AppBar(
          title: Image.asset(
            image_names.logo,
            width: 40.0,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Log Out',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
            ),
          ],
          flexibleSpace: Container(
            height: screenSize.height * .4,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(230.0, 55.0)),
              child: Image.asset(
                image_names.backgroundEdited,
                fit: BoxFit.fill,
              ),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(650),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                        side: MaterialStatePropertyAll(
                            BorderSide(width: 0.0, color: Colors.transparent))),
                    clipBehavior: Clip.none,
                    onPressed: () {
                      print('Clicked');
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
                                        color: Colors.black, fontSize: 20.0)),
                              ),
                            ])),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                        side: MaterialStatePropertyAll(
                            BorderSide(width: 0.0, color: Colors.transparent))),
                    clipBehavior: Clip.none,
                    onPressed: () {
                      print('Clicked');
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
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ])),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(0.0)),
                        side: MaterialStatePropertyAll(
                            BorderSide(width: 0.0, color: Colors.transparent))),
                    clipBehavior: Clip.none,
                    onPressed: () {
                      print('Clicked');
                    },
                    child: roundedContainer(
                        boxColor: Colors.amber,
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
                                      color: Colors.black, fontSize: 20.0),
                                ),
                              ),
                            ])),
                  ),
                ],
              )),
        ),
      ),
      body: HomeContents(),
    );
  }
}


