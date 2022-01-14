import 'package:flutter/material.dart';

class InfoIconWidget extends StatelessWidget {
  String title;
  String data;

  InfoIconWidget({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            title + ":  ",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            data,
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),
          )
        ],
      ),
    );
  }
}
