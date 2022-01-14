import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int currentScreen = 0;

class _MainScreenState extends State<MainScreen> {
  TextEditingController textEditingController = TextEditingController();

  late ScrollController _controller;
  double screenSize = 0.0;
  @override
  initState() {
    _controller = ScrollController();
    _controller.addListener(listener);
    perform();
    super.initState();
  }

  perform() {
    if (currentScreen == 0) {
      Timer.periodic(const Duration(milliseconds: 500), (timer) {
        setState(() {
          if (textEditingController.text.length < 8) {
            textEditingController.text += "11";
          } else {
            textEditingController.text = "0";
          }
        });
      });
    }
  }

  listener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 5;
      });
    }
    // print(_controller.offset);
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 0;
      });
    }
    if (_controller.offset > screenSize * 0 &&
        _controller.offset < screenSize * 1 &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 1;
      });
    }
    if (_controller.offset > screenSize * 1 &&
        _controller.offset < screenSize * 2 &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 2;
      });
    }
    if (_controller.offset > screenSize * 2 &&
        _controller.offset < screenSize * 3 &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 3;
      });
    }
    if (_controller.offset > screenSize * 4 &&
        _controller.offset < screenSize * 5 &&
        !_controller.position.outOfRange) {
      setState(() {
        currentScreen = 4;
      });
    }
    // if (_controller.offset > screenSize * 1 &&
    //     _controller.offset < screenSize * 2 &&
    //     !_controller.position.outOfRange) {
    //   setState(() {
    //     currentScreen = 5;
    //   });
    // }
  }

  changeValue() {
    setState(() {});
    _controller.animateTo(screenSize * (currentScreen),
        curve: Curves.linear, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;
    setState(() {
      screenSize = sizeData.height;
    });
    return Scaffold(
      body: Container(
        height: sizeData.height,
        child: Row(
          children: [
            if (sizeData.width > 900)
              Container(
                height: sizeData.height,
                width: 300,
                color: Theme.of(context).primaryColorDark,
                child: NavigationDrawer(
                  change: changeValue,
                  // active: currentScreen,
                ),
              ),
            Container(
              height: sizeData.height,
              width: (sizeData.width > 900)
                  ? sizeData.width - 300
                  : sizeData.width,
              // padding: const EdgeInsets.all(20.0),
              child: ListView(
                controller: _controller,
                children: [
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.yellow,
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          readOnly: true,
                          controller: textEditingController,
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.teal,
                    child: const Center(
                      child: Text("Screen2"),
                    ),
                  ),
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.blue,
                    child: const Center(
                      child: Text("Screen3"),
                    ),
                  ),
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.brown,
                    child: const Center(
                      child: Text("Screen4"),
                    ),
                  ),
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.red,
                    child: const Center(
                      child: Text("Screen5"),
                    ),
                  ),
                  Container(
                    height: sizeData.height,
                    width: (sizeData.width > 900)
                        ? sizeData.width - 300
                        : sizeData.width,
                    color: Colors.red,
                    child: const Center(
                      child: Text("Screen6"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
