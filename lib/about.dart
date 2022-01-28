import 'package:flutter/material.dart';
import 'package:portfolio/info.dart';

class About extends StatelessWidget {
  bool viewChanged;
  About({Key? key, required this.viewChanged}) : super(key: key);
  buildright() {
    return [
      InfoIconWidget(data: "21", title: "Age"),
      InfoIconWidget(data: "B.E(Cse Final year)", title: "Degree"),
      InfoIconWidget(data: "ak2917065@gmail.com", title: "Email"),
      InfoIconWidget(data: "Available", title: "Freelance"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: sizeData.width > 900
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.start,
        children: [
          Text(
            "About",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 70, child: Divider()),
          if (!viewChanged) ...[
            // Center(
            //   child: Image(
            //     image: const AssetImage("assets/profile.JPG"),
            //     width: viewChanged ? sizeData.width * .25 : sizeData.width * .5,
            //     height: 300,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Text(
              "I build Mobile Applications with Flutter.",
              style:
                  Theme.of(context).textTheme.caption?.copyWith(fontSize: 18),
            ),
            SizedBox(
                height: sizeData.height * .5,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              InfoIconWidget(
                                  data: "30 June 2001", title: "BirthDate"),
                              InfoIconWidget(data: ".com", title: "Website"),
                              InfoIconWidget(
                                  data: "+91 9653662159", title: "Phone"),
                              InfoIconWidget(
                                  data: "Banglore, India", title: "City"),
                            ] +
                            (viewChanged ? [] : buildright()),
                      ),
                    ]))
          ] else ...[
            Container(
              height: sizeData.height * .7,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: const AssetImage("assets/profile.JPG"),
                    width: viewChanged
                        ? sizeData.width * .25
                        : sizeData.width * .5,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: sizeData.width * .5,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Stack Mobile Developer",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: sizeData.height * .5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InfoIconWidget(
                                          data: "30 June 2001",
                                          title: "BirthDate"),
                                      InfoIconWidget(
                                          data: ".com", title: "Website"),
                                      InfoIconWidget(
                                          data: "+91 9653662159",
                                          title: "Phone"),
                                      InfoIconWidget(
                                          data: "Banglore, India",
                                          title: "City"),
                                    ]
                                    // +
                                    // (viewChanged ? [] : buildright()),
                                    ),
                                // if (viewChanged)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InfoIconWidget(data: "21", title: "Age"),
                                    InfoIconWidget(
                                        data: "B.E(Cse Final year)",
                                        title: "Degree"),
                                    InfoIconWidget(
                                        data: "ak2917065@gmail.com",
                                        title: "Email"),
                                    InfoIconWidget(
                                        data: "Available", title: "Freelance"),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                  )
                ],
              ),
            )
          ]
        ],
      ),
    );
  }
}
