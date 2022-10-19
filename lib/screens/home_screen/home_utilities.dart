// Box Arc
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(10.0)),
      width: screenSize.width * 0.30,
      height: screenSize.height * 0.160,
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
    return Card(
      color: _open ? Colors.blue : Colors.grey,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                _open = !_open;
              });
            },
            child: ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                _open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 34.0,
              ),
            ),
          ),
          _open
              ? Container(
                  color: Colors.white,
                  width: screenSize.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: widget.child)
              : Container()
        ],
      ),
    );
  }
}


// Widget for Accordion content
class doubleBoxes extends StatelessWidget {
  const doubleBoxes({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      style:
                          TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ))
            ],
          ),
        ),
        Container(
          width: screenSize.width,
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
              border:
                  Border.all(color: Color.fromARGB(255, 180, 172, 172)),
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
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'JMD 1314.14',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
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
                          onPressed: () {},
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
    );
  }
}

