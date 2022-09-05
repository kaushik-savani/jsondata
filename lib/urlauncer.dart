import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class demo4 extends StatefulWidget {
  const demo4({Key? key}) : super(key: key);

  @override
  State<demo4> createState() => _demo4State();
}

class _demo4State extends State<demo4> {
  final Uri _url = Uri.parse('https://www.amazon.in/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: ElevatedButton(onPressed: () async {
            try {
              await launchUrl(_url,mode: LaunchMode.inAppWebView);
            } catch (e) {
              print(e);
            }
          }, child: Text("Rate"))),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
