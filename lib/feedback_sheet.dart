import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  String error = "";
  bool isLoading = false;
  buildTextField(String hint, TextEditingController controller) {
    return Container(
      width: 300,
      height: hint == "Message" ? 150 : 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColorDark)),
      child: TextField(
        // expands: true,
        maxLines: 8,
        minLines: 6,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildTextField("Name", name),
          buildTextField("Email", email),
          buildTextField("Message", message),
          if (error != "")
            Text(
              error,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Theme.of(context).errorColor),
            ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (message.text.isEmpty &&
                        email.text.isEmpty &&
                        name.text.isEmpty) {
                      setState(() {
                        error = "All fields are Reqiured";
                      });
                      return;
                    }
                    const url =
                        "https://flutter-project-bb713-default-rtdb.firebaseio.com/message.json";
                    await http.post(Uri.parse(url),
                        body: json.encode({
                          "name": name.text,
                          "email": email.text,
                          "message": message.text
                        }));
                    setState(() {
                      isLoading = false;
                    });
                    setState(() {
                      error = "Your message has been sent ";
                    });
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Send Message")))
        ],
      ),
    );
  }
}
