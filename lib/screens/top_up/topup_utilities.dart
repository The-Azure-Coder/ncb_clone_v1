import 'package:flutter/material.dart';

// Custom AppBar
class TextIconBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  TextIconBar({Key? key, required this.title, required this.preferredSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
      ),
      titleSpacing: 00.0,
      centerTitle: true,
      toolbarHeight: 120.2,
      toolbarOpacity: 0.8,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.white, size: 37))
      ],
      flexibleSpace: Container(
        height: 180,
        color: Colors.blue,
      ),
    );
  }
}

// Icon Accordions
class IconDropDown extends StatefulWidget {
  const IconDropDown(
      {super.key,
      required this.number,
      required this.title,
      required this.child,
      required this.subtitle});
  final int number;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  State<IconDropDown> createState() => _IconDropDownState();
}

class _IconDropDownState extends State<IconDropDown> {
  bool _open = true;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      elevation: 15,
      margin: EdgeInsets.all(20),
      color: _open ? Colors.blue : Colors.grey,
      shadowColor: Colors.black,
      child: Column(children: [
        TextButton(
          onPressed: () {
            setState(() {
              _open = !_open;
            });
          },
          child: ListTile(
            focusColor: Colors.blue,
            leading: Container(
              width: 30,
              height: 30,
              decoration: new BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Center(
                  child: Text(
                "${widget.number}",
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            subtitle: Text(
              widget.subtitle,
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
                child: widget.child)
            : Container(),
      ]),
    );
  }
}
