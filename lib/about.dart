import 'package:flutter/material.dart';
import 'package:portfolio/info.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "About",
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 70, child: Divider()),
        Text(
          "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. \nSit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.",
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 18),
        ),
        Container(
          height: sizeData.height * .7,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: const AssetImage("assets/profile.JPG"),
                width: sizeData.width * .25,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: sizeData.width * .5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Stack Mobile Developer",
                        style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: sizeData.height * .4,
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
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ],
    );
  }
}
