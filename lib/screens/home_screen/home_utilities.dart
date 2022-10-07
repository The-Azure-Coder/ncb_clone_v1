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
        height: screenSize.height * 0.08,
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
      width: screenSize.width * 0.31,
      height: screenSize.height * 0.135,
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

