import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class demo5 extends StatefulWidget {
  const demo5({Key? key}) : super(key: key);

  @override
  State<demo5> createState() => _demo5State();
}

class _demo5State extends State<demo5> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WebView(initialUrl: 'myfile/buynow.dart.html',
      javascriptMode: JavascriptMode.unrestricted,
      );
  }
  /*Future<void> _onLoadHtmlStringExample(
      WebViewController controller, BuildContext context) async {
    await controller.loadHtmlString("myfile/buynow.dart.html");
  }*/
}
