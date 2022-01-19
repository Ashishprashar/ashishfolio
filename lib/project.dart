import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:html' as html;

class ProjectItem extends StatefulWidget {
  double height;
  List images;
  String title;
  String link;
  ProjectItem(
      {Key? key,
      required this.height,
      required this.images,
      required this.link,
      required this.title})
      : super(key: key);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  int index = 0;
  late Timer timer;
  bool mouseOn = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        html.window.open(widget.link, "_blank");
      },
      child: MouseRegion(
        onEnter: (pointer) {
          timer = Timer.periodic(const Duration(milliseconds: 800), (t) {
            setState(() {
              mouseOn = true;
            });
            if (index == widget.images.length - 1) {
              setState(() {
                index = 0;
              });
            } else {
              setState(() {
                index += 1;
              });
            }
          });
        },
        onExit: (p) {
          setState(() {
            mouseOn = false;
          });
          timer.cancel();
        },
        child: Center(
          child: Container(
            height: widget.height * .75 - (mouseOn ? 30 : 0),
            width: 300 - (mouseOn ? 30 : 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.all((mouseOn ? 50 : 20)),
            child: Stack(
              children: [
                Container(
                  width: 300 - (mouseOn ? 30 : 0),
                  height: widget.height * .75 - (mouseOn ? 30 : 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          height: widget.height * .6,
                          padding: EdgeInsets.all(mouseOn ? 0 : 30),
                          child: Image.asset(
                            "assets/${widget.images[index]}.jpg",
                            fit: BoxFit.fill,
                          )),
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  ),
                ),
                // if (mouseOn)
                //   Container(
                //     height: widget.height * .6,
                //     width: 300,
                //     alignment: Alignment.bottomCenter,
                //     padding: EdgeInsets.all(mouseOn ? 0 : 30),
                //     decoration: BoxDecoration(
                //         color:
                //             Theme.of(context).primaryColorLight.withOpacity(.3)),
                //     child: const Text("Tap here "),
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
