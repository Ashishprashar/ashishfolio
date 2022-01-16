import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  double height;
  double width;
  Resume({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  buildEducation(
      BuildContext context, String title, String duration, String institute) {
    return Container(
      height: 120,
      child: Stack(
        children: [
          Positioned(
              top: 5,
              left: 11,
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark)))),
          Positioned(
              left: 15,
              top: 15,
              bottom: 0,
              child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: Theme.of(context).primaryColorDark)),
          Positioned(
            height: 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Theme.of(context).primaryColorLight,
                  child: Center(
                    child: Text(duration),
                  ),
                ),
                Text(institute)
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildExperience(BuildContext context, String title, String duration,
      String institute, List<String> details) {
    return Container(
      height: 120 + 30.0 * details.length,
      child: Stack(
        children: [
          Positioned(
              top: 5,
              left: 11,
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark)))),
          Positioned(
              left: 15,
              top: 15,
              bottom: 0,
              child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: Theme.of(context).primaryColorDark)),
          Positioned(
            height: 120 + 30.0 * details.length,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Theme.of(context).primaryColorLight,
                  child: Center(
                    child: Text(duration),
                  ),
                ),
                Text(institute),
                for (var i = 0; i < details.length; i++)
                  Container(
                    height: 20,
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: 3,
                          margin: const EdgeInsets.only(right: 10),
                          decoration:
                              BoxDecoration(color: Theme.of(context).hintColor),
                        ),
                        Text(details[i]),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildLanguages(
    BuildContext context,
    List<String> title,
  ) {
    return Container(
      height: 100,
      child: Stack(
        children: [
          Positioned(
              top: 5,
              left: 11,
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark)))),
          Positioned(
              left: 15,
              top: 15,
              bottom: 0,
              child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: Theme.of(context).primaryColorDark)),
          Positioned(
            height: 120,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0; i < title.length; i++)
                  Container(
                    height: 20,
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                          width: 3,
                          margin: const EdgeInsets.only(right: 10),
                          decoration:
                              BoxDecoration(color: Theme.of(context).hintColor),
                        ),
                        Text(title[i]),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSkills(BuildContext context, String title, double percentage) {
    return Container(
      height: 50,
      width: 200,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: Theme.of(context).textTheme.subtitle2),
          SizedBox(
            height: 10,
            child: Stack(
              children: [
                Container(
                  height: 10,
                  width: 200,
                  color: Theme.of(context).primaryColorLight,
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    height: 10,
                    width: 200 * percentage,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        padding: const EdgeInsets.all(20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Resume",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Education",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildEducation(context, "B.Engineering(CSE)", "2018 - 2022",
                    "K.S School of Engineering and management \nBanglore"),
                buildEducation(context, "12th(Non-Med)", "2016 - 2018",
                    "G.S.S.S (Boys)\nDhanaula"),
                Text(
                  "Skills",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildSkills(context, "Flutter", 1),
                buildSkills(context, "Android", .8),
                buildSkills(context, "Python", .7),
                buildSkills(context, "Firebase", .9),
                buildSkills(context, "NoSQL", .75),
                buildSkills(context, "Git", .7),
                buildSkills(context, "MongoDB", .7),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Professional Experience",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildExperience(context, "Flutter Developer Intern",
                    "Aug/2021 - Nov/2021 ", "SoftEZi Solutions LLP\n(Remote)", [
                  "Worked on android application projects with flutter framework.",
                  "Handle backend for the applications (Firebase, Mongodb)",
                  "Built api’s in Node.js"
                ]),
                buildExperience(context, "Flutter Developer Intern",
                    "NovAug/2021 - Present ", "Trainer Goes Online\n(Remote)", [
                  "Worked on a hybrid application named Trainer Goes Online..",
                  "Integrated Google Fit and SendGrid Api in app",
                  "Implemented Cloud functions for Notifications and Remote Config"
                ]),
                Text(
                  "Languages",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                buildLanguages(context, ["English", "Hindi", "Punjabi"])
              ],
            ))
          ],
        ));
  }
}
