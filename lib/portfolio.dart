import 'package:flutter/material.dart';
import 'package:portfolio/project.dart';

class Portfolio extends StatelessWidget {
  double height;
  double width;
  Portfolio({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contact",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 70, child: Divider()),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ProjectItem(
                  height: height,
                  images: const [
                    "netflix 1",
                    "netflix 2",
                    "netflix 3",
                    "netflix 4"
                  ],
                  link: "https://github.com/Ashishprashar/netflix_clone",
                  title: "Netflix Clone",
                ),
                ProjectItem(
                  height: height,
                  images: const ["shop 1", "shop 2", "shop 3", "shop 4"],
                  link: "https://github.com/Ashishprashar/ShopApp",
                  title: "Shop App",
                ),
                ProjectItem(
                  height: height,
                  images: const [
                    "expense 1",
                    "expense 2",
                    "expense 3",
                  ],
                  link: "https://github.com/Ashishprashar/expense_app",
                  title: "Expense App",
                ),
                ProjectItem(
                  height: height,
                  images: const [
                    "grocery 1",
                    "grocery 2",
                  ],
                  link: "https://github.com/Ashishprashar/GroceryApp  ",
                  title: "Grocery App",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
