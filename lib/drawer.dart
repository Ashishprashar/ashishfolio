import 'package:flutter/material.dart';
import 'package:portfolio/custom_icon.dart';
import 'package:portfolio/main_screen.dart';
import 'package:portfolio/side_icon_text_button.dart';
import 'dart:html' as html;

class NavigationDrawer extends StatefulWidget {
  Function change;
  // int active;
  NavigationDrawer({Key? key, required this.change
      // , required this.active
      })
      : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  // int select = -1;
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;

    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: CircleAvatar(
        //     radius: sizeData.height * .1,
        //     foregroundImage: const AssetImage("assets/profile.JPG"),
        //   ),
        // ),
        Text(
          "Ashish Kumar",
          style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.bold),
        ),
        // Icon(Icons)
        Container(
            height: sizeData.height * .1,
            margin: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIcons(
                  icon: Image.asset("assets/github.png"),
                  onTap: () {
                    html.window
                        .open("https://github.com/Ashishprashar", "_blank");
                  },
                ),
                CustomIcons(
                  icon: Image.asset("assets/instagram.png"),
                  onTap: () {
                    html.window.open(
                        "https://www.instagram.com/ig__ashish/", "_blank");
                  },
                ),
                CustomIcons(
                  icon: Image.asset("assets/facebook.png"),
                  onTap: () {
                    html.window.open(
                        "https://www.facebook.com/Ashishkumarb", "_blank");
                  },
                ),
                CustomIcons(
                  icon: Image.asset("assets/linkdin.png"),
                  onTap: () {
                    html.window.open(
                        "https://www.linkedin.com/in/ashish-kumar-b68b851a0/",
                        "_blank");
                  },
                ),
              ],
            )),
        SizedBox(
          height: sizeData.height * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SideIconTextButton(
                icon: Icons.home_outlined,
                title: "Home",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 0;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 0,
              ),
              SideIconTextButton(
                icon: Icons.person_outline_outlined,
                title: "About",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 1;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 1,
              ),
              SideIconTextButton(
                icon: Icons.file_present_rounded,
                title: "Resume",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 2;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 2,
              ),
              SideIconTextButton(
                icon: Icons.web_sharp,
                title: "Portfolio",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 3;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 3,
              ),
              SideIconTextButton(
                icon: Icons.home_repair_service_rounded,
                title: "Services",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 4;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 4,
              ),
              SideIconTextButton(
                icon: Icons.email_outlined,
                title: "Contact",
                // height: sizeData.height * .5 / 7,
                change: () {
                  setState(() {
                    currentScreen = 5;
                  });
                  widget.change();
                },
                isSelected: currentScreen == 5,
              ),
            ],
          ),
        )
      ],
    );
  }
}
