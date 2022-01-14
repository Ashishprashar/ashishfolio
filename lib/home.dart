import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  double width;
  double height;
  Home({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  List text = [
    "I'm",
    "I'm M",
    "I'm Mo",
    "I'm Mob",
    "I'm Mobi ",
    "I'm Mobil ",
    "I'm Mobile ",
    "I'm Mobile D",
    "I'm Mobile De",
    "I'm Mobile Dev",
    "I'm Mobile Deve",
    "I'm Mobile Devel",
    "I'm Mobile Develo",
    "I'm Mobile Develop",
    "I'm Mobile Develope",
    "I'm Mobile Developer",
  ];
  int i = 0;
  bool isDecreasing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = "I'm Mobile Developer";
    // perform();
  }

  // perform() {
  //   // if (currentScreen == 0) {
  //   Timer.periodic(const Duration(milliseconds: 100), (timer) {
  //     if (i < text.length && !isDecreasing) {
  //       setState(() {
  //         i++;
  //       });
  //     } else {
  //       setState(() {
  //         isDecreasing = true;
  //       });
  //       Future.delayed(const Duration(seconds: 2));
  //       while (i != 2) {
  //         Future.delayed(const Duration(milliseconds: 100)).then((value) {
  //           setState(() {
  //             i--;
  //             textEditingController.text = text[i];
  //           });
  //         });
  //       }
  //       // });
  //     }
  //     setState(() {
  //       isDecreasing = false;
  //       textEditingController.text = text[i];
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/cover.JPG",
          width: widget.width,
          height: widget.height,
          fit: BoxFit.cover,
        ),
        Container(
          height: widget.height,
          width: widget.width,
          color: Theme.of(context).primaryColorDark.withOpacity(.5),
        ),
        Positioned(
            top: widget.height * .3,
            left: widget.width * .2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ashish Kumar",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                ),
                SizedBox(
                  width: 400,
                  child: TextField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    readOnly: true,
                    showCursor: true,
                    controller: textEditingController,
                    cursorColor: Theme.of(context).scaffoldBackgroundColor,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
