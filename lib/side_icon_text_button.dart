import 'package:flutter/material.dart';

class SideIconTextButton extends StatefulWidget {
  String title;
  IconData icon;
  bool isSelected;
  // double height;
  Function change;
  SideIconTextButton(
      {Key? key,
      required this.icon,
      required this.title,
      // required this.height,
      required this.change,
      this.isSelected = false})
      : super(key: key);

  @override
  State<SideIconTextButton> createState() => _SideIconTextButtonState();
}

class _SideIconTextButtonState extends State<SideIconTextButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.change();
      },
      child: Container(
        // height: widget.height,
        margin: const EdgeInsets.symmetric(horizontal: 34),
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
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 30,
                color: isSelected || widget.isSelected
                    ? Colors.blue
                    : Theme.of(context).backgroundColor,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: isSelected
                        ? Theme.of(context).scaffoldBackgroundColor
                        : Theme.of(context).backgroundColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
