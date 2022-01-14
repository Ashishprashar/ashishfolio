import 'package:flutter/material.dart';

class CustomIcons extends StatefulWidget {
  Widget icon;
  Function onTap;
  CustomIcons({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  State<CustomIcons> createState() => _CustomIconsState();
}

class _CustomIconsState extends State<CustomIcons> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: MouseRegion(
        onEnter: (p) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (p) {
          setState(() {
            isSelected = false;
          });
        },
        child: CircleAvatar(
          radius: 18.0,
          backgroundColor:
              isSelected ? Colors.blue : Theme.of(context).accentColor,
          child: SizedBox(height: 16.0, width: 16.0, child: widget.icon),
        ),
      ),
    );
  }
}
