import 'package:flutter/material.dart';

class Resume extends StatelessWidget {
  double height;
  double width;
  Resume({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Resume",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Education",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      // color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [],
            ))
          ],
        ));
  }
}
