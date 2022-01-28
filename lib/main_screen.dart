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

    perform();
    super.initState();
  }

  perform() {}

  listener() {
    setState(() {
      currentScreen = pageController.page!.ceil();
    });
  }

  changeValue() {
    pageController.jumpToPage(currentScreen);
    // print();

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
                    // Container(
                    //     height: sizeData.height,
                    //     width: (sizeData.width > 900)
                    //         ? sizeData.width - 300
                    //         : sizeData.width,
                    //     padding: const EdgeInsets.all(20),
                    //     child:
                    About(viewChanged: sizeData.width > 900),
                    // ),,

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
