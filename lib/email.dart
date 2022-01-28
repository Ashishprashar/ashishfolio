import 'package:flutter/material.dart';
import 'package:portfolio/feedback_sheet.dart';

class Contact extends StatelessWidget {
  double height;
  double width;
  Contact({Key? key, required this.height, required this.width})
      : super(key: key);
  buildInfo(context, IconData icon, String title, String info) {
    return Container(
      margin: const EdgeInsets.only(left: 40, top: 40, bottom: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorLight,
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColorDark,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                info,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).accentColor),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> contact(context) {
    return [
      Container(
        height: height * .7,
        width: width < 900 ? width * .9 : width * .5,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  offset: const Offset(4, 4),
                  color: Theme.of(context).hintColor),
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20.0)),
        // padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildInfo(context, Icons.location_on_outlined, "Location:",
                "#10, 2nd floor, 5th main\nRaghuvanahalli\nBanglore,India,560062"),
            buildInfo(context, Icons.email, "Email:", "ak2917065@gmail.com"),
            buildInfo(context, Icons.phone_android, "Call:", "+91 9653662159"),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  offset: const Offset(4, 4),
                  color: Theme.of(context).hintColor),
            ],
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20.0)),
        height: height * .7,
        width: width < 900 ? width * .9 : width * .5,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: const FeedBack(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: width > 900 ? Axis.horizontal : Axis.vertical,
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
            if (width > 900)
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: contact(context))
            else
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: contact(context))
          ],
        ),
      ),
    );
  }
}
