import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/drawer.dart';
import 'package:portfolio/email.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/portfolio.dart';
import 'package:portfolio/resume.dart';
import 'package:portfolio/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int currentScreen = 0;

class _MainScreenState extends State<MainScreen> {
  // TextEditingController textEditingController = TextEditingController();
  PageController pageController = PageController();

  // late ScrollController pageController;
  double screenSize = 0.0;
  @override
  initState() {
    pageController.addListener(listener);
    // pageController = ScrollController();
    // pageController.addListener(listener);

    perform();
    super.initState();
  }

  perform() {
    // if (currentScreen == 0) {
    //   Timer.periodic(const Duration(milliseconds: 500), (timer) {
    //     setState(() {
    //       if (textEditingController.text.length < 8) {
    //         textEditingController.text += "11";
    //       } else {
    //         textEditingController.text = "0";
    //       }
    //     });
    //   });
    // }
  }

  listener() {
    if (pageController.offset >= pageController.position.maxScrollExtent &&
        !pageController.position.outOfRange) {
      setState(() {
        currentScreen = 4;
      });
    }
    // print(pageController.offset);
    else if (pageController.offset <= pageController.position.minScrollExtent &&
        !pageController.position.outOfRange) {
      setState(() {
        currentScreen = 0;
      });
    } else if (pageController.offset > screenSize * 1 &&
        pageController.offset < screenSize * 2 &&
        !pageController.position.outOfRange) {
      setState(() {
        currentScreen = 1;
      });
    } else if (pageController.offset > screenSize * 2 &&
        pageController.offset < screenSize * 3 &&
        !pageController.position.outOfRange) {
      setState(() {
        currentScreen = 2;
      });
    } else if (pageController.offset > screenSize * 3 &&
        pageController.offset < screenSize * 4 &&
        !pageController.position.outOfRange) {
      setState(() {
        currentScreen = 3;
      });
    }
    // if (pageController.offset > screenSize * 4 &&
    //     pageController.position.maxScrollExtent < screenSize * 5 &&
    //     !pageController.position.outOfRange) {
    //   setState(() {
    //     currentScreen = 4;
    //   });
    // }
  }

  changeValue() {
    pageController.jumpToPage(currentScreen);
    // pageController.animateTo(screenSize * (currentScreen),
    //     curve: Curves.linear, duration: const Duration(milliseconds: 500));
    setState(() {});
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
                child: PageView(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  children: [
                    Home(
                      width: (sizeData.width > 900)
                          ? sizeData.width - 300
                          : sizeData.width,
                      height: sizeData.height,
                    ),
                    Container(
                        height: sizeData.height,
                        width: (sizeData.width > 900)
                            ? sizeData.width - 300
                            : sizeData.width,
                        padding: const EdgeInsets.all(20),
                        child: About(viewChanged: sizeData.width > 900)),

                    Resume(
                      width: (sizeData.width > 900)
                          ? sizeData.width - 300
                          : sizeData.width,
                      height: sizeData.height,
                    ),
                    Portfolio(
                      width: (sizeData.width > 900)
                          ? sizeData.width - 300
                          : sizeData.width,
                      height: sizeData.height,
                    ),

                    Contact(
                      width: (sizeData.width > 900)
                          ? sizeData.width - 300
                          : sizeData.width,
                      height: sizeData.height,
                    ),

                    // Container(
                    //     height: sizeData.height,
                    //     width: (sizeData.width > 900)
                    //         ? sizeData.width - 300
                    //         : sizeData.width,
                    //     child: const Services()),
                  ],
                )
                // ListView(
                //   controller: pageController,
                //   children: [
                //     Home(
                //       width: (sizeData.width > 900)
                //           ? sizeData.width - 300
                //           : sizeData.width,
                //       height: sizeData.height,
                //     ),
                //     Container(
                //         height: sizeData.height,
                //         width: (sizeData.width > 900)
                //             ? sizeData.width - 300
                //             : sizeData.width,
                //         padding: const EdgeInsets.all(20),
                //         child: About(viewChanged: sizeData.width > 900)),

                //     Resume(
                //       width: (sizeData.width > 900)
                //           ? sizeData.width - 300
                //           : sizeData.width,
                //       height: sizeData.height,
                //     ),
                //     Portfolio(
                //       width: (sizeData.width > 900)
                //           ? sizeData.width - 300
                //           : sizeData.width,
                //       height: sizeData.height,
                //     ),

                //     Contact(
                //       width: (sizeData.width > 900)
                //           ? sizeData.width - 300
                //           : sizeData.width,
                //       height: sizeData.height,
                //     ),

                //     // Container(
                //     //     height: sizeData.height,
                //     //     width: (sizeData.width > 900)
                //     //         ? sizeData.width - 300
                //     //         : sizeData.width,
                //     //     child: const Services()),
                //   ],
                // ),

                )
          ],
        ),
      ),
    );
  }
}
